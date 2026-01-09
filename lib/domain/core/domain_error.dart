sealed class DomainError {
  const DomainError();
}

class ValidationError extends DomainError {
  final String message;
  const ValidationError(this.message);

  @override
  String toString() => 'ValidationError(message: $message)';
}

class InvalidStateError extends DomainError {
  final String message;
  const InvalidStateError(this.message);

  @override
  String toString() => 'InvalidStateError(message: $message)';
}

class ParseError extends DomainError {
  final String message;
  const ParseError(this.message);

  @override
  String toString() => 'ParseError(message: $message)';
}

class NotFoundError extends DomainError {}

class ConflictError extends DomainError {}

class NetworkError extends DomainError {
  final String message;
  const NetworkError(this.message);

  @override
  String toString() => 'NetworkError(message: $message)';
}

class UnexpectedError extends DomainError {
  final Object cause;
  const UnexpectedError(this.cause);

  @override
  String toString() => 'UnexpectedError(cause: $cause)';
}

class UnknownError extends DomainError {}
