import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../users/model/model.dart';

class AuthData extends Equatable {
  final String token;
  final User data;

  const AuthData({
    required this.data,
    required this.token,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      data: User.fromJson(json['data']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'token': token,
    };
  }

  factory AuthData.fromRawJson(String rawJson) {
    final Map<String, dynamic> jsonMap = json.decode(rawJson);
    return AuthData.fromJson(jsonMap);
  }

  String toRawJson() {
    final Map<String, dynamic> jsonMap = toJson();
    return json.encode(jsonMap);
  }

  AuthData copyWith({
    User? data,
    String? token,
  }) {
    return AuthData(
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }

  static const empty = AuthData(
    data: User.empty,
    token: '',
  );
  bool get isEmpty => this == AuthData.empty;

  bool get isNotEmpty => this != AuthData.empty;
  // listen(void Function(dynamic) data) {}
  @override
  List<Object?> get props => [data, token];
}
