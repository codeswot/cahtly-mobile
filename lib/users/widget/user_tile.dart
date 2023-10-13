import 'package:chatlly/auth/model/model.dart';
import 'package:chatlly/chats/service/service.dart';
import 'package:chatlly/users/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTile extends StatelessWidget {
  const UserTile({required this.user, required this.authData, super.key});
  final User user;
  final AuthData authData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        final tt = ChatService().generateRoomId(authData.data.id, user.id);
        print(tt);
      },
      leading: CircleAvatar(
        radius: 30.sp,
        backgroundColor: Colors.blueGrey,
        child: (user.name?.isEmpty ?? false || user.name == null)
            ? Icon(
                Icons.person,
                color: Colors.white,
                size: 30.sp,
              )
            : Text(
                '${user.name?.substring(0, 1)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                ),
              ),
      ),
      title: Text(
        (user.name?.isEmpty ?? false) ? 'private' : user.name ?? 'private',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        user.email,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: IconButton.filledTonal(
        onPressed: () {},
        icon: const Icon(Icons.chat_bubble),
      ),
    );
  }
}
