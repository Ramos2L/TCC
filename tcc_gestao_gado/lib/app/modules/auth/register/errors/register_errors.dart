abstract class RegisterFailure implements Exception {
  String? get message;
}

class UnusualException implements RegisterFailure {
  @override
  final String? message;
  UnusualException({this.message});
}

class EmailAlreadyInUseException implements RegisterFailure {
  @override
  final String? message;
  EmailAlreadyInUseException({this.message});
}

class InvalidEmailException implements RegisterFailure {
  @override
  final String? message;
  InvalidEmailException({this.message});
}

class OperationNotAllowedException implements RegisterFailure {
  @override
  final String? message;
  OperationNotAllowedException({this.message});
}

class WeakPasswordException implements RegisterFailure {
  @override
  final String? message;
  WeakPasswordException({this.message});
}
