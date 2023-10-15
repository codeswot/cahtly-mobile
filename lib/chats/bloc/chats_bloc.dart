import 'package:chatlly/auth/services/auth_service.dart';
import 'package:chatlly/chats/data/chat_data.dart';
import 'package:chatlly/chats/service/service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatService chatService;
  final AuthService authService;

  ChatsBloc({
    required this.chatService,
    required this.authService,
  }) : super(ChatsState.initial(chatService.fetchAllChats$())) {
    on<ChatsFetchAll>(_onChatsFetchAll);
    on<ChatsFetchByRoom>(_onChatsFetchByRoom);
  }
  _onChatsFetchAll(ChatsFetchAll event, Emitter<ChatsState> emit) async {
    await chatService.initializeChat();
    final chats = chatService.fetchAllChats$();
    emit(
      state.copyWith(
        status: ChatsStatus.initial,
        chats: chats,
      ),
    );
  }

  _onChatsFetchByRoom(ChatsFetchByRoom event, Emitter<ChatsState> emit) async {
    final currentAuthData = await authService.currentAuthData;
    final currentUserId = currentAuthData.data.id;
    final recieverId = event.userId;
    final roomId = chatService.generateRoomId(recieverId, currentUserId);
    debugPrint('d $roomId');
    final roomChats = chatService.fetchChatFromRoom$('120c2dc4');
    emit(
      state.copyWith(
        status: ChatsStatus.loaded,
        roomChat: roomChats,
      ),
    );
  }
}
