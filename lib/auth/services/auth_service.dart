import 'package:chatlly/auth/model/model.dart';
import 'package:chatlly/shared/shared.dart';

class AuthService {
  final HttpService _httpService = HttpService();
  final LoggingService _logger = LoggingService();
  final SharedPrefService _prefService = SharedPrefService();
  final String _authEndpoint = 'auth';
  Future<AuthData> login(String email, String password) async {
    try {
      final data = await _httpService.post('$_authEndpoint/login', {
        'email': email.toLowerCase(),
        'password': password,
      });
      _logger.info('message $data');
      final authData = AuthData.fromJson(data);
      await _saveUserDetails(authData.toRawJson());
      return authData;
    } catch (e, t) {
      _logger.error('AuthService(login) $e', e, t);
      await _saveUserDetails(AuthData.empty.toRawJson());
      rethrow;
    }
  }

  Future<AuthData> register(String email, String password, String name) async {
    try {
      final data = await _httpService.post('$_authEndpoint/register', {
        'email': email.toLowerCase(),
        'password': password,
        'name': name,
      });
      _logger.info('message $data');
      final authData = AuthData.fromJson(data);
      await _saveUserDetails(authData.toRawJson());
      return authData;
    } catch (e, t) {
      _logger.error('AuthService(register) $e', e, t);
      await _saveUserDetails(AuthData.empty.toRawJson());
      rethrow;
    }
  }

  logOut() async {
    //maybe other logout logic ...
    await _saveUserDetails(AuthData.empty.toRawJson());
  }

  _saveUserDetails(String userData) async {
    await _prefService.saveString('current_user', userData);
  }

  Future<AuthData> _getcurrentAuthData() async {
    AuthData authData = AuthData.empty;
    try {
      final dataString = await _prefService.getString('current_user');
      if (dataString != null) {
        authData = AuthData.fromRawJson(dataString);
      }

      return authData;
    } catch (e, t) {
      _logger.error('AuthService(_getcurrentAuthData) $e', e, t);
      return authData;
    }
  }

  Future<AuthData> get currentAuthData async => await _getcurrentAuthData();
}
