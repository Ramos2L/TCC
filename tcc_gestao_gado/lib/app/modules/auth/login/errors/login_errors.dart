abstract class LoginFailure implements Exception {
  String? get message;
}

class UnsualException implements LoginFailure {
  @override
  final String? message;
  UnsualException({this.message});
}

class UserNotFoundException implements LoginFailure {
  @override
  final String? message;
  UserNotFoundException({this.message});
}

class UserDisabledException implements LoginFailure {
  @override
  final String? message;
  UserDisabledException({this.message});
}

class InvalidEmailException implements LoginFailure {
  @override
  final String? message;
  InvalidEmailException({this.message});
}

class WrongPasswordException implements LoginFailure {
  @override
  final String? message;
  WrongPasswordException({this.message});
}
