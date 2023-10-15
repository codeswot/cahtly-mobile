import 'package:chatlly/chats/data/chat_data.dart';
import 'package:realm/realm.dart';

class ChatDatabase {
  final _config = Configuration.local([ChatData.schema]);

  create(List<ChatData> chats) {
    Realm realm = Realm(_config);
    realm.write(() {
      realm.addAll(chats);
    });
  }

  List<ChatData> getAllByRoomId(String roomId) {
    Realm realm = Realm(_config);

    return realm.query<ChatData>("roomId == '$roomId'").toList();
  }

  Stream<List<ChatData>> getAllByRoomId$(String roomId) {
    Realm realm = Realm(_config);

    final chatDataResults =
        realm.query<ChatData>("roomId == '$roomId'").changes;

    return chatDataResults.map((event) {
      final chatDataList = event.results.toList();

      final distinctChatDataMap = <String, ChatData>{};

      for (final chatData in chatDataList) {
        if (!distinctChatDataMap.containsKey(chatData.chatId)) {
          distinctChatDataMap[chatData.chatId] = chatData;
        }
      }

      // Extract distinct chatData items from the map
      final distinctChatDataList = distinctChatDataMap.values.toList();

      return distinctChatDataList;
    });
  }

  Stream<List<ChatData>> getAll$() {
    Realm realm = Realm(_config);

    return realm.all<ChatData>().changes.map((event) {
      final chatDataList = event.results.toList();

      chatDataList.sort((a, b) => b.timestamp.compareTo(a.timestamp));

      final distinctChatDataMap = <String, ChatData>{};

      for (final chatData in chatDataList) {
        if (!distinctChatDataMap.containsKey(chatData.roomId)) {
          distinctChatDataMap[chatData.roomId] = chatData;
        }
      }

      // Extract distinct chatData items from the map
      final distinctChatDataList = distinctChatDataMap.values.toList();

      return distinctChatDataList;
    });
  }

  ChatData? getByChatId(String chatId) {
    Realm realm = Realm(_config);

    return realm.query<ChatData>("chatId == '$chatId'").singleOrNull;
  }

  Stream<ChatData>? getByChatId$(String chatId) {
    Realm realm = Realm(_config);

    return realm
        .query<ChatData>("chatId == '$chatId'")
        .changes
        .map((event) => event.results.first);
  }

  update(ChatData chat) async {
    Realm realm = Realm(_config);
    realm.write(() {
      realm.add<ChatData>(chat, update: true);
    });
  }

  delete(ChatData chat) {
    Realm realm = Realm(_config);
    realm.write(() {
      realm.delete(chat);
    });
  }

  deleteAllInRoom(String roomId) {
    Realm realm = Realm(_config);
    final chats = getAllByRoomId(roomId);
    realm.write(() {
      realm.deleteMany(chats);
    });
  }

  deleteAll() {
    Realm realm = Realm(_config);
    realm.write(() {
      realm.deleteAll<ChatData>();
    });
  }
}
