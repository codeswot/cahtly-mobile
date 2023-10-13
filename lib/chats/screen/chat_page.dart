import 'package:chatlly/auth/bloc/auth_bloc.dart';
import 'package:chatlly/auth/screen/screen.dart';
import 'package:chatlly/auth/services/auth_service.dart';
import 'package:chatlly/chats/bloc/chats_bloc.dart';
import 'package:chatlly/chats/screen/all_chats.dart';
import 'package:chatlly/chats/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) =>
              AuthBloc(AuthService())..add(const AuthDataChanged()),
        ),
        BlocProvider<ChatsBloc>(
          create: (context) => ChatsBloc(
            chatService: ChatService(),
            authService: AuthService(),
          )..add(
              const ChatsFetchAll(),
            ),
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state == const AuthState.unauthenticated()) {
            return const LoginScreen();
          }
          return const AllChatsListScreen();
        },
      ),
    );
  }
}
