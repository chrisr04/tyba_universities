sealed class Result<T> {
  const Result();

  factory Result.ok(T data) => Ok<T>(data);

  factory Result.failure(Exception error) => Failure<T>(error);

  bool get isOk => this is Ok<T>;

  bool get isFailure => this is Failure<T>;
}

final class Ok<T> extends Result<T> {
  const Ok(this.value);

  final T value;
}

final class Failure<T> extends Result<T> {
  const Failure(this.exception);

  final Exception exception;
}
