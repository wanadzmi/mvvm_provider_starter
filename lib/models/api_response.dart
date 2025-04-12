// ignore_for_file: constant_identifier_names

class ApiResponse<T, V> {
  ApiResponse.error(V error, {Map<String, List<String>>? headers})
      : _status = ResponseStatus.ERROR,
        _error = error,
        _data = null,
        _headers = headers;

  ApiResponse.complete(T data, {Map<String, List<String>>? headers})
      : _status = ResponseStatus.COMPLETED,
        _data = data,
        _error = null,
        _headers = headers;

  ApiResponse.loading()
      : _status = ResponseStatus.LOADING,
        _data = null,
        _error = null,
        _headers = null;

  ApiResponse.initial()
      : _status = ResponseStatus.INITIAL,
        _data = null,
        _error = null,
        _headers = null;

  final ResponseStatus _status;
  final T? _data;
  final V? _error;
  final Map<String, List<String>>? _headers;

  V? get error => _error;
  T? get data => _data;
  ResponseStatus get status => _status;
  Map<String, List<String>>? get headers => _headers;
}

enum ResponseStatus { INITIAL, COMPLETED, ERROR, LOADING, CONSUMED }
