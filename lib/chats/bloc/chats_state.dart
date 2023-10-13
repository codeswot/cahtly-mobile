part of 'chats_bloc.dart';

enum ChatsStatus {
  loaded,
  error,
  initial,
}

final class ChatsState extends Equatable {
  const ChatsState._({
    required this.status,
    this.errorMessage = '',
    this.chats = const Stream.empty(),
  });

  const ChatsState.initial()
      : this._(
          status: ChatsStatus.initial,
          chats: const Stream.empty(),
          errorMessage: '',
        );

  const ChatsState.loaded(Stream<List<ChatData>> chats)
      : this._(
          status: ChatsStatus.loaded,
          chats: chats,
          errorMessage: '',
        );

  const ChatsState.error(String error)
      : this._(
          status: ChatsStatus.error,
          errorMessage: error,
        );

  final ChatsStatus status;
  final Stream<List<ChatData>> chats;
  final String errorMessage;

  @override
  List<Object?> get props => [status, chats, errorMessage];
}
