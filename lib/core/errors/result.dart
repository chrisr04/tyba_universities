sealed class Result<T> {
  const Result();

  factory Result.ok(T data) => Ok<T>(data);

  factory Result.failure(Exception error) => Failure<T>(error);

  bool get isOk => this is Ok<T>;

  bool get isFailure => this is Failure<T>;

  T get data {
    if (isFailure) throw StateError('Unavailable data');

    return (this as Ok<T>).value;
  }

  Exception? get error {
    if (isOk) return null;

    return (this as Failure<T>).exception;
  }
}

final class Ok<T> extends Result<T> {
  const Ok(this.value);

  final T value;
}

final class Failure<T> extends Result<T> {
  const Failure(this.exception);

  final Exception exception;
}
