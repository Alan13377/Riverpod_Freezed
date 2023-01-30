import 'package:riverpod_freezed/app/data/services/api_services.dart';
import 'package:riverpod_freezed/app/domain/repositories/character_repository.dart';

//*Funcion que impementara los metodos para obtener los datos de la api
class CharacterRepositoryImpl extends CharacterRepository {
  final ApiServices _api;
  CharacterRepositoryImpl(this._api);
  @override
  GetPricesFuture getCharacteres() {
    return _api.getCharacters();
  }
}
