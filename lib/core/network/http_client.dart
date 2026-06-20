import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tyba_universities/core/network/http_constants.dart';

class HttpClient {
  HttpClient();

  late Dio _dio;

  @visibleForTesting
  void setClientMock(Dio clientMock) {
    _dio = clientMock;
  }

  void createClient() {
    final Dio dio = Dio();
    dio.options.baseUrl = HttpConstants.baseUrl;
    _dio = dio;
  }

  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) {
    return _dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
