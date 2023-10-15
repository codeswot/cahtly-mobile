import 'dart:convert';

import 'package:chatlly/auth/services/auth_service.dart';
import 'package:chatlly/chats/data/chat_data.dart';
import 'package:chatlly/chats/data/data.dart';
import 'package:chatlly/chats/model/chat_model.dart';
import 'package:chatlly/shared/shared.dart';
import 'package:crypto/crypto.dart';

class ChatService {
  final ChatDatabase _db = ChatDatabase();
  final HttpService _http = HttpService();
  final LoggingService _logger = LoggingService();
  final AuthService _authService = AuthService();
  final String _chatsEndpoint = 'chats';

  Stream<List<ChatData>> fetchChatFromRoom$(String roomId) {
    return _db.getAllByRoomId$(roomId);
  }

  Stream<List<ChatData>> fetchAllChats$() {
    return _db.getAll$();
  }

  Future initializeChat() async {
    try {
      final currentUserData = await _authService.currentAuthData;
      final data = await _http.get(
        '$_chatsEndpoint/${currentUserData.data.id}',
        token: currentUserData.token,
      );
      _logger.info('messages $data');
      final List chatsJson = data;
      if (chatsJson.isEmpty) {
        return;
      }
      final chats = chatsJson.map((e) => ChatModel.fromJson(e)).toList();

      await _saveChatToDb(chats);
    } catch (e, t) {
      _logger.error('ChatService(initializeChat) $e', e, t);
      return;
    }
  }

  _saveChatToDb(List<ChatModel> chatFromServer) async {
    final chats = chatFromServer.map((chatFromServer) {
      return ChatData(
        chatFromServer.chatId ?? '',
        chatFromServer.roomId,
        chatFromServer.text,
        chatFromServer.fromId,
        chatFromServer.toId,
        chatFromServer.timestamp,
        chatFromServer.replyId,
        chatFromServer.mediaUrl,
        chatFromServer.mediaType,
      );
    }).toList();

    _db.create(chats);
  }

  String generateRoomId(String currentUserId, recieverId) {
    String combinedValues = '$currentUserId$recieverId';

    List<int> bytes = utf8.encode(combinedValues);
    Digest digest = sha1.convert(bytes);

    String uniqueKey = digest.toString().substring(0, 8);

    return uniqueKey;
  }

  deleteAll() {
    _db.deleteAll();
  }
}
