import 'package:chatlly/chats/bloc/chats_bloc.dart';
import 'package:chatlly/chats/data/chat_data.dart';
import 'package:chatlly/chats/screen/screen.dart';
import 'package:chatlly/shared/utils/utils.dart';
import 'package:chatlly/users/data/data.dart';
import 'package:chatlly/users/service/users_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTile extends StatelessWidget {
  const ChatTile(
    this.chat, {
    super.key,
  });
  final ChatData chat;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<ChatsBloc>().add(ChatsFetchByRoom(chat.roomId));

        context.push(ChatScreen(chat));
      },
      leading: CircleAvatar(
        radius: 30.sp,
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 30.sp,
        ),
      ),
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
          }),
      subtitle: Text(
        chat.text,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: Text(chat.timestamp),
    );
  }
}
