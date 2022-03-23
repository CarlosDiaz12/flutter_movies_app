class ServerException implements Exception {
  String cause;
  ServerException(this.cause);
}

class LoginFailedException implements Exception {
  String cause;
  LoginFailedException(this.cause);
}

class MovieNotFoundException implements Exception {
  String cause;
  MovieNotFoundException(this.cause);
}
