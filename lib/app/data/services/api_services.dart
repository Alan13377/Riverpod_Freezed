import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:riverpod_freezed/app/domain/either/either.dart';
import 'package:riverpod_freezed/app/domain/failures/http_request_failures.dart';
import 'package:riverpod_freezed/app/domain/models/character.dart';
import 'package:riverpod_freezed/app/domain/repositories/character_repository.dart';

//*Peticion a la API
class ApiServices {
  final Client client;

  ApiServices({required this.client});

  GetPricesFuture getCharacters() async {
    try {
      final response = await client.get(
        Uri.parse(
          "https://rickandmortyapi.com/api/character",
        ),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final characters = (data["results"] as List).map(
          (e) => Character(
            id: e["id"],
            name: e["name"],
            image: e["image"],
            gender: e["gender"],
          ),
        );

        return Either.right(characters.toList());
      }
      if (response.statusCode == 404) {
        throw HttpRequestFailure.notFound();
      }

      if (response.statusCode >= 500) {
        throw HttpRequestFailure.server();
      }
      throw HttpRequestFailure.local();
    } catch (e) {
      late HttpRequestFailure failure;
      if (e is HttpRequestFailure) {
        failure = e;
      } else if (e is SocketException || e is ClientException) {
        //*Errores por conexion
        failure = HttpRequestFailure.network();
      } else {
        failure = HttpRequestFailure.local();
      }
      return Either.left(failure);
    }
  }
}
