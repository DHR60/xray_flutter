sealed class DomainError {
  const DomainError();
}

class ValidationError extends DomainError {
  final String message;
  const ValidationError(this.message);
}

class InvalidStateError extends DomainError {
  final String message;
  const InvalidStateError(this.message);
}

class NotFoundError extends DomainError {}

class ConflictError extends DomainError {}

class UnexpectedError extends DomainError
{
    final Object cause;
    const UnexpectedError(this.cause);
}

class UnknownError extends DomainError {}