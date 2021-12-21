import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart';

typedef RequestFunction = Future<Response> Function();

abstract class HttpRepositoryBase extends RepositoryBase {
  HttpRepositoryBase({
    required this.http,
    required this.baseUrl,
    this.headers,
    List<Interceptor>? interceptors,
  }) {
    if (interceptors != null) {
      for (final interceptor in interceptors) {
        http.interceptors.add(interceptor);
      }
    }
    if (kDebugMode) {
      http.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 75,
      ));
    }
  }

  final Dio http;
  final String baseUrl;
  final Map<String, dynamic>? headers;

  String getApiUrl(
    String resource,
  ) {
    return baseUrl + (resource.startsWith('/') ? resource : '/$resource');
  }

  Map<String, dynamic> getHeaders([
    Map<String, dynamic>? headers,
  ]) {
    return {
      ...this.headers ?? {},
      ...headers ?? {},
    };
  }
}
