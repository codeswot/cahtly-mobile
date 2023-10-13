import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String? name;
  final int? age;

  const User({
    required this.id,
    required this.email,
    this.name,
    this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      name: json['name'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'name': name,
      'age': age,
    };
  }

  factory User.fromRawJson(String rawJson) {
    final Map<String, dynamic> jsonMap = json.decode(rawJson);
    return User.fromJson(jsonMap);
  }

  String toRawJson() {
    final Map<String, dynamic> jsonMap = toJson();
    return json.encode(jsonMap);
  }

  User copyWith({
    String? name,
    String? email,
    int? age,
    String? password,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
    );
  }

  static const empty = User(
    id: '',
    name: '',
    email: '',
    age: 0,
  );
  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;
  @override
  List<Object?> get props => [id, name, email, age];
}
