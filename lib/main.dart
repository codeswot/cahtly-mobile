import 'package:chatlly/auth/auth.dart';
import 'package:chatlly/auth/bloc/auth_bloc.dart';
import 'package:chatlly/auth/services/service.dart';
import 'package:chatlly/bloc_observer.dart';
import 'package:chatlly/chats/bloc/chats_bloc.dart';
import 'package:chatlly/chats/service/chat.dart';
import 'package:chatlly/shared/shared.dart';
import 'package:chatlly/users/bloc/users_bloc.dart';
import 'package:chatlly/users/service/users_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(
    const ChatllyApp(),
  );
}

class ChatllyApp extends StatelessWidget {
  const ChatllyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) =>
                  AuthBloc(AuthService())..add(const AuthDataChanged()),
            ),
            BlocProvider<UsersBloc>(
              create: (context) => UsersBloc(
                UsersService(),
              )..add(
                  const UsersFetch(),
                ),
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
          child: MaterialApp(
            title: 'Chatlly',
            theme: darkTheme,
            home: const LoginScreen(),
          ),
        );
      },
    );
  }
}
