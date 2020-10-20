enum Status { error, success }

class ApiResponse<T> {
  String _message;
  T data;
  Status status;

  String get message => _message;

  ApiResponse.error(this._message) {
    status = Status.error;
  }
  ApiResponse.success(this.data) {
    status = Status.success;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ApiResponse<T> &&
        o._message == _message &&
        o.data == data &&
        o.status == status;
  }

  @override
  int get hashCode => _message.hashCode ^ data.hashCode ^ status.hashCode;

  @override
  String toString() =>
      'ApiResponse(_message: $_message, data: $data, status: $status)';
}
