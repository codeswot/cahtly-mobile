import 'package:chatlly/auth/bloc/auth_bloc.dart';
import 'package:chatlly/users/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return AllUsers(state.authData);
      },
    );
  }
}
