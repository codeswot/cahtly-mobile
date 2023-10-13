import 'package:chatlly/auth/model/model.dart';
import 'package:chatlly/users/bloc/users_bloc.dart';
import 'package:chatlly/users/widget/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';

class AllUsers extends StatelessWidget {
  const AllUsers(this.authData, {super.key});
  final AuthData authData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, usersState) {
          final users = usersState.users;
          return ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: 30.h,
            ),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return UserTile(
                user: user,
                authData: authData,
              );
            },
          );
        },
      ).redacted(
        context: context,
        redact: true,
        configuration: RedactedConfiguration(
          animationDuration: const Duration(
            milliseconds: 800,
          ),
        ),
      ),
    );
  }
}
