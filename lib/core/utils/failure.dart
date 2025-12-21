class Failure {
  Failure({String? message, this.statusCode})
    : message = message ?? 'Unexpected error';

  final String message;
  final String? statusCode;
  @override
  String toString() {
    return '\n Failure(message: $message, statusCode: $statusCode)';
  }
}
