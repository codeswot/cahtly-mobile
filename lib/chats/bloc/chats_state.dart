part of 'chats_bloc.dart';

enum ChatsStatus {
  loaded,
  error,
  initial,
}

final class ChatsState extends Equatable {
  final ChatsStatus status;
  final Stream<List<ChatData>> chats;
  final Stream<List<ChatData>> roomChat;
  final String errorMessage;
  const ChatsState({
    required this.status,
    required this.chats,
    required this.roomChat,
    required this.errorMessage,
  });
  copyWith({
    ChatsStatus? status,
    Stream<List<ChatData>>? chats,
    Stream<List<ChatData>>? roomChat,
    String? errorMessage,
  }) {
    return ChatsState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      roomChat: roomChat ?? this.roomChat,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory ChatsState.initial(Stream<List<ChatData>> chats) => ChatsState(
        status: ChatsStatus.initial,
        chats: chats,
        roomChat: Stream.value([]),
        errorMessage: '',
      );

  @override
  List<Object?> get props => [
        status,
        chats,
        roomChat,
        errorMessage,
      ];
}
