class FailedException implements Exception {
  final String _message;

  FailedException(this._message);

  @override
  String toString() => '$_message';
}
