import 'package:chatlly/chats/bloc/chats_bloc.dart';
import 'package:chatlly/chats/data/chat_data.dart';
import 'package:chatlly/chats/widget/widget.dart';
import 'package:chatlly/shared/shared.dart';
import 'package:chatlly/users/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllChatsListScreen extends StatelessWidget {
  const AllChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chatlly',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton.filledTonal(
            icon: const Icon(Icons.add),
            onPressed: () => context.push(const UserPage()),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: BlocBuilder<ChatsBloc, ChatsState>(
        builder: (context, state) {
          return StreamBuilder<List<ChatData>>(
            stream: state.chats,
            builder: (context, snapshot) {
              final chats = snapshot.data ?? [];
              return ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: 30.h,
                ),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ChatTile(chat);
                },
              );
            },
          );
        },
      ),
    );
  }
}
