class Failure {
  final String _message;

  const Failure(this._message);

  String get message => _message;

  @override
  String toString() => _message;
}

class ArgumentError extends Failure {
  final dynamic data;
  const ArgumentError(String message, {this.data}) : super(message);
}

class ApiFailure extends Failure {
  ApiFailure(super.message);

}

enum ApiErrors {
  badRequest,
  serverError,
  failure,
  unknown,
  unauthenticated,
  notPermitted,
  notFound
}