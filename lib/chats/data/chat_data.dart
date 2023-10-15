import 'package:realm/realm.dart';

part 'chat_data.g.dart';

@RealmModel()
class _ChatData {
  @PrimaryKey()
  late String chatId;
  late String roomId;
  late String text;
  late String fromId;
  late String toId;
  late String timestamp;
  late String replyId;
  late String mediaUrl;
  late String mediaType;
}
