import 'package:chatlly/auth/model/auth_data.dart';
import 'package:chatlly/auth/services/service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(const AuthState.unauthenticated()) {
    on<AuthDataChanged>(_onAuthDataChanged);
    on<AuthLogInRequested>(_onAuthLogInRequested);
    on<AuthRegisterRequested>(_onAuthRegisterRequested);

    on<AuthLogoutRequested>(_onAuthLogOutRequested);
  }

  void _onAuthDataChanged(
      AuthDataChanged event, Emitter<AuthState> emit) async {
    final authData = await authService.currentAuthData;
    emit(
      authData.isNotEmpty
          ? AuthState.authenticated(authData)
          : const AuthState.unauthenticated(),
    );
  }

  void _onAuthLogInRequested(
      AuthLogInRequested event, Emitter<AuthState> emit) async {
    final authData = await authService.login(event.email, event.password);
    emit(
      authData.isNotEmpty
          ? AuthState.authenticated(authData)
          : const AuthState.unauthenticated(),
    );
  }

  void _onAuthRegisterRequested(
      AuthRegisterRequested event, Emitter<AuthState> emit) async {
    final authData = await authService.register(
      event.email,
      event.password,
      event.name,
    );
    emit(
      authData.isNotEmpty
          ? AuthState.authenticated(authData)
          : const AuthState.unauthenticated(),
    );
  }

  void _onAuthLogOutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    await authService.logOut();
    emit(
      const AuthState.unauthenticated(),
    );
  }
}
