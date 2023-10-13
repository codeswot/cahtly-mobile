part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

// TODO: add error message later
final class AuthState extends Equatable {
  const AuthState._({
    required this.status,
    this.authData = AuthData.empty,
  });

  const AuthState.authenticated(AuthData data)
      : this._(
          status: AuthStatus.authenticated,
          authData: data,
        );

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  final AuthStatus status;
  final AuthData authData;

  @override
  List<Object> get props => [status, authData];
}
