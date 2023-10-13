import 'package:chatlly/auth/services/auth_service.dart';
import 'package:chatlly/shared/shared.dart';
import 'package:chatlly/users/data/data.dart';
import 'package:chatlly/users/model/model.dart';

class UsersService {
  final HttpService _httpService = HttpService();
  final AuthService _authService = AuthService();
  final LoggingService _logger = LoggingService();
  final UserDatabase _db = UserDatabase();
  final String _usersEndpoint = 'users';
  Future<void> getAllUsers() async {
    try {
      final data = await _httpService.get(
        _usersEndpoint,
        token: (await _authService.currentAuthData).token,
      );
      _logger.info('message $data');
      final List<dynamic> jsonData = data;
      final List<User> users = jsonData.map((e) => User.fromJson(e)).toList();
      _saveUsers(users);
    } catch (e, t) {
      _logger.error('UsersService(getAllUsers) $e', e, t);
    }
  }

  _getUsers() {
    final usersData = _db.getAllUsers();

    final users = usersData
        .map((e) => User(
              id: e.id,
              email: e.email,
              name: e.name,
              age: e.age,
            ))
        .toList();
    return users;
  }

  Future<UserData?> getUserById({
    required String fromId,
    required String toId,
  }) async {
    final userData = await _authService.currentAuthData;
    if (toId == userData.data.id) {
      return _db.getUserById(fromId);
    }
    if (fromId == userData.data.id) {
      return _db.getUserById(toId);
    }

    return null;
  }

  get getUsers => _getUsers();

  _saveUsers(List<User> users) {
    final usersData = users
        .map((e) => UserData(
              e.id,
              e.email,
              name: e.name,
              age: e.age,
            ))
        .toList();
    _db.addUsers(usersData);
  }
}
