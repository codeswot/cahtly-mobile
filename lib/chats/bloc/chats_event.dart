part of 'chats_bloc.dart';

sealed class ChatsEvent {
  const ChatsEvent();
}

final class ChatsFetchAll extends ChatsEvent {
  const ChatsFetchAll();
}

class ChatsFetchByRoom extends ChatsEvent {
  const ChatsFetchByRoom(this.userId);
  final String userId;
}
