import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_freezed/app/domain/failures/http_request_failures.dart';
import 'package:riverpod_freezed/app/domain/models/character.dart';
part "character_state.freezed.dart";

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.loading() = _Loading;
  const factory CharacterState.failed(HttpRequestFailure failure) = _Failed;
  const factory CharacterState.loaded({
    required List<Character> characters,
  }) = _CharacterState;
}
