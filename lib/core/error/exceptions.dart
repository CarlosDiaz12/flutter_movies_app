class ServerException implements Exception {
  String cause;
  ServerException(this.cause);
}

class LoginFailedException implements Exception {
  String cause;
  LoginFailedException(this.cause);
}

class NotFoundException implements Exception {
  String cause;
  NotFoundException(this.cause);
}

class UnknownErrorException implements Exception {
  String cause;
  UnknownErrorException(this.cause);
}
