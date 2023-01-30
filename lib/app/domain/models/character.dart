import 'package:freezed_annotation/freezed_annotation.dart';

part "character.freezed.dart";

@freezed
class Character with _$Character {
  factory Character({
    required int id,
    required String name,
    required String image,
    required String gender,
  }) = _Character;
}
