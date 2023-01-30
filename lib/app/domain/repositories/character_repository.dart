//*Error ---- Exito
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_freezed/app/data/repository_impl/character_repository_impl.dart';
import 'package:riverpod_freezed/app/data/services/api_services.dart';
import 'package:riverpod_freezed/app/domain/either/either.dart';
import 'package:riverpod_freezed/app/domain/failures/http_request_failures.dart';
import 'package:riverpod_freezed/app/domain/models/character.dart';

//*Error ---- Exito
typedef GetPricesFuture = Future<Either<HttpRequestFailure, List<Character>>>;

//*Funcion que obtendra los datos de la api
abstract class CharacterRepository {
  GetPricesFuture getCharacteres();
}

//*Provider que dara acceso a los metodos del repository
final characterRepository = Provider(
  (ref) => CharacterRepositoryImpl(
    ApiServices(
      client: Client(),
    ),
  ),
);
