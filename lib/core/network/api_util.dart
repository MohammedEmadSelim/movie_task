import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:egb_task/core/network/api_endpoints.dart';
import 'package:egb_task/core/network/credentials.dart';
class ApiUtil {
  final Dio _dio;

  ApiUtil(this._dio) {
    init();
  }

  void init() {
    _dio
      ..options.baseUrl = ApiEndpoints.baseUrl
      ..options.headers = {
        "Accept": "application/json",
        "Authorization": "Bearer $accessToken"
      };
  }

  Future<Response<dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeader,
    Map<String, dynamic>? parameters,
  }) async {

    if (extraHeader != null) {
      _dio.options.headers.addAll(extraHeader);
    }
    log('ApiUtil: get: endpoint: $endpoint');
    log('ApiUtil: get: header: ${_dio.options.headers}');
    var response = await _dio.get(
      endpoint,
      data: body,
      queryParameters: parameters,
    );
    return response;
  }

  Future<Response<dynamic>> post(
      {required String endpoint,
      required dynamic body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? extraHeader}) async {

    log('ApiUtil: post: endpoint: $endpoint');
    if (extraHeader != null) {
      _dio.options.headers.addAll(extraHeader);
    }
    return await _dio.post(endpoint, data: body, queryParameters: parameters);
  }



}
