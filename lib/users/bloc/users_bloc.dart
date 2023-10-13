import 'package:chatlly/users/model/model.dart';
import 'package:chatlly/users/service/users_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersFetch, UsersState> {
  final UsersService usersService;
  UsersBloc(this.usersService)
      : super(const UsersState(
          [],
        )) {
    on<UsersFetch>((event, emit) async {
      await usersService.getAllUsers();
      final users = usersService.getUsers;
      emit(UsersState(users));
    });
  }
}
