import 'package:chatlly/shared/model/api_exeption.dart';
import 'package:chatlly/shared/shared.dart';
import 'package:dio/dio.dart';

///Http SERVICE
/// exposes all the available api methods
/// get, post and put http requests
/// Example usage:
/// ```dart
/// HttpService httpService = HttpService();
/// httpService.get('/');
/// ```
/// returns ```dart
/// Future<dynamic>
/// ``` as the body of the api response
/// Throws an [Exception] if something goes wrong.
class HttpService {
  final Dio _dio = Dio();

  final _kBaseUrl = kBaseUrl;

  /// Make a GET request,
  /// expected input is the desired endpoint
  /// Example usage:
  /// ```dart
  /// get('/');
  /// ```
  /// returns a Future containing the response body
  Future<dynamic> get(String endpoint, {String? token}) async {
    try {
      final res = await _dio.get(
        '$_kBaseUrl/$endpoint',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
      if (res.statusCode != 200) {
        throw ApiExcepetion(
          message: res.statusMessage ?? 'Error',
          statusCode: res.statusCode ?? 500,
        );
      }
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Make a POST request,
  /// expected input is the desired endpoint and the request body
  /// Example usage:
  /// ```dart
  /// post('/endpoint',{data: 'value', data: 'value'});
  /// ```
  /// returns a Future containing the response body
  Future<dynamic> post(String endpoint, Map<String, dynamic> body,
      {String? token}) async {
    try {
      final res = await _dio.post(
        '$_kBaseUrl/$endpoint',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
        data: body,
      );
      if (res.statusCode != 200) {
        throw ApiExcepetion(
          message: res.statusMessage ?? 'Error',
          statusCode: res.statusCode ?? 500,
        );
      }

      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Make a PUT request,
  /// expected input is the desired endpoint and the request body
  /// Example usage:
  /// ```dart
  /// put('/',{data: "value"});
  /// ```
  /// returns a Future containing the response body
  Future<dynamic> put(String endpoint, dynamic body, {String? token}) async {
    try {
      final res = await _dio.put(
        '$_kBaseUrl/$endpoint',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
        data: body,
      );
      if (res.statusCode != 200) {
        throw ApiExcepetion(
          message: res.statusMessage ?? 'Error',
          statusCode: res.statusCode ?? 500,
        );
      }
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
