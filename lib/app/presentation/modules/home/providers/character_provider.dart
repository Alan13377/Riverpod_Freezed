import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_freezed/app/domain/repositories/character_repository.dart';
import 'package:riverpod_freezed/app/presentation/modules/home/providers/character_state.dart';

final charactersProvider =
    StateNotifierProvider<CharacterProvider, CharacterState>((ref) {
  final provider = ref.watch(characterRepository);
  return CharacterProvider(provider);
});

class CharacterProvider extends StateNotifier<CharacterState> {
  final CharacterRepository characterRepository;
  CharacterProvider(this.characterRepository)
      : super(const CharacterState.loading()) {
    loadCharacteres();
  }

  loadCharacteres() async {
    final characterList = await characterRepository.getCharacteres();

    characterList.when(left: (failure) {
      state = CharacterState.failed(failure);
    }, right: (characters) {
      state = CharacterState.loaded(
        characters: characters,
      );
    });

    //print(characterList.value);
  }
}
