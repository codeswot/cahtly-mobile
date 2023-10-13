part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthLogInRequested extends AuthEvent {
  const AuthLogInRequested(
    this.email,
    this.password,
  );
  final String email;
  final String password;
}

final class AuthRegisterRequested extends AuthEvent {
  const AuthRegisterRequested(
    this.email,
    this.password,
    this.name,
  );
  final String email;
  final String password;
  final String name;
}

final class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}

final class AuthDataChanged extends AuthEvent {
  const AuthDataChanged();
}
