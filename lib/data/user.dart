import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@Collection(ignore: {'copyWith'})
@freezed
class User with _$User {
  const factory User({
    required String name,
  }) = _User;

  Id get id => Isar.autoIncrement;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
