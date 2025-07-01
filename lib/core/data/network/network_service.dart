import 'package:dio/dio.dart';

abstract class NetworkService {
  Future<Map<String, dynamic>?> getHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    String? baseUrl,
    CancelToken? cancelToken,
  });

  Future<Map<String, dynamic>?> postHttp(
    String endpoint, {
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    String? baseUrl,
    CancelToken? cancelToken,
  });

  Future<Map<String, dynamic>?> putHttp(
    String endpoint, {
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    String? baseUrl,
    CancelToken? cancelToken,
  });

  Future<Map<String, dynamic>?> deleteHttp(
    String endpoint, {
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    String? baseUrl,
    CancelToken? cancelToken,
  });
}
