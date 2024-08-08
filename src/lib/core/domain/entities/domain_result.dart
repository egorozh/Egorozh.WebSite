sealed class DomainResult<T, E> {}

final class Success<T, E> extends DomainResult<T, E> {
  Success(this.data);

  final T data;
}

final class Error<T, E> extends DomainResult<T, E> {
  Error(this.errorData);

  final E errorData;
}

enum DomainErrorType {
  serverError,
  connectionError,
  local,
}

typedef EmptyDomainResult = DomainResult<void, DomainErrorType>;

typedef CommonDomainResult<T> = DomainResult<T, DomainErrorType>;
