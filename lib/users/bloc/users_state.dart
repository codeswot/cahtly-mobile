part of 'users_bloc.dart';

class UsersState extends Equatable {
  const UsersState(this.users);
  final List<User> users;
  @override
  List<Object> get props => [users];
}
