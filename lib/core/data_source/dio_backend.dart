import 'dart:io';

import 'package:dio/dio.dart';
import 'package:egb_task/core/constants/credentials.dart';
import 'package:egb_task/core/data_source/logging_interceptor.dart';

class DioBackend {
  Dio dio;
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;

  DioBackend({
    required this.baseUrl,
    required this.loggingInterceptor,
    required this.dio,
  }) {
    dio
      ..options.baseUrl = baseUrl
      ..httpClientAdapter
      ..options.headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
    dio.interceptors.add(loggingInterceptor);
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dynamic response = await dio.post(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }


}
