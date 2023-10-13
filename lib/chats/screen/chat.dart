import 'package:chatlly/chats/bloc/chats_bloc.dart';
import 'package:chatlly/chats/data/chat_data.dart';
import 'package:chatlly/users/data/user_data.dart';
import 'package:chatlly/users/service/users_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen(this.chat, {super.key});
  final ChatData chat;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: FutureBuilder<UserData?>(
              future: UsersService().getUserById(
                toId: chat.toId,
                fromId: chat.fromId,
              ),
              builder: (context, snapshot) {
                final data = snapshot.data;
                return Text(
                  data?.name ?? data?.email ?? 'private',
                  style: Theme.of(context).textTheme.titleLarge,
                );
              },
            ),
          ),
          body: StreamBuilder<List<ChatData>>(
            stream: state.chats,
            builder: (context, snapshot) {
              final chats = snapshot.data ?? [];

              return ListView.builder(
                itemCount: chats.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return SizedBox(
                    child: Text(chat.text),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
