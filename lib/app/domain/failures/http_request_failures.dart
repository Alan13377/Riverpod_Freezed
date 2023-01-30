import 'package:freezed_annotation/freezed_annotation.dart';
part "http_request_failures.freezed.dart";

@freezed
class HttpRequestFailure with _$HttpRequestFailure {
  factory HttpRequestFailure.network() = Network;
  factory HttpRequestFailure.notFound() = NorFound;
  factory HttpRequestFailure.server() = Server;
  factory HttpRequestFailure.unauthorized() = Unautorized;
  factory HttpRequestFailure.badRequest() = BadRequest;
  factory HttpRequestFailure.local() = Local;
}
