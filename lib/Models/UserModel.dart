// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class UserModel {
  final String name;
  final int age;

  const UserModel({
    required this.name,
    required this.age,
  });

  UserModel copyWith({
    String? name,
    int? age,
  }) {
    return UserModel(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, age: $age)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class UserModelNotifier extends StateNotifier<UserModel> {
  // Gives access to state of variable which can be used to update the data.
  // UserModelNotifier(super.state);
  UserModelNotifier()
      : super(
          const UserModel(name: '', age: 0),
        )
  // {updateName('aaa');}
  ;

  void updateName(String n) {
    n = 'Dr. $n';
    state = state.copyWith(name: n);
  }

  void updateAge(int a) {
    state = state.copyWith(age: a);
  }
}

class UserModelChangeNotifierProvider extends ChangeNotifier {
  UserModel user = const UserModel(name: '', age: 0);

  void updateName(String n) {
    n = 'Dr. $n';
    user = user.copyWith(name: n);
  }

  void updateAge(int a) {
    user = user.copyWith(age: a);
  }
}
