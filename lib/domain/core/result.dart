import 'package:xray_flutter/domain/core/domain_error.dart';

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);

  @override
  String toString() => 'Success(data: $data)';
}

class Failure<T> extends Result<T>
{
    final DomainError error;
    const Failure(this.error);
    factory Failure.from(Failure other) => Failure(other.error);

    @override
    String toString() => 'Failure(error: $error)';
}