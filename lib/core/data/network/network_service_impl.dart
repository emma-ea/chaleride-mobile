import 'dart:io';

import 'package:chaleride/core/data/network/network_service.dart';
import 'package:chaleride/core/platform/flavor.dart';
import 'package:chaleride/core/utilities/extensions.dart';
import 'package:chaleride/core/utilities/failures.dart';
import 'package:chaleride/core/utilities/logging_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkServiceImpl implements NetworkService {

  late Dio _dio;

  final _dioOptions = BaseOptions(
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'CR-Client-OS': Platform.isAndroid ? 'ANDROID' : 'IOS',
      'CR-Client-Version': null,
      'CR-Client-Device-ID': null
    },
    connectTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    baseUrl: FlavorConfig.instance.values.baseUrl,
  );

  final interceptors = [
    if (kDebugMode) {
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true
      ),
    },
    InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) async {
        // TODO: intercept request. add auth token
        // options.headers.addAll({'Authorization': 'Bearer ---'});
        return handler.next(options);
      }
    ),
  ];

  NetworkServiceImpl() {
    _dio = Dio(_dioOptions);
    interceptors.forEach(_addInterceptors);
  }

  void _addInterceptors(dynamic interceptor) {
    _dio.interceptors.add(interceptor);
  }

  @override
  Future<Map<String, dynamic>?> deleteHttp(String endpoint, {body, Map<String, dynamic>? params, Map<String, dynamic>? headers, String? baseUrl, CancelToken? cancelToken}) async {
    logger.i('\n deleteHttp: $endpoint params: ${params.toString()}\n');
    if (endpoint.isValidUrlEndpoint()) throw const ArgumentError('deleteHttp Endpoint invalid');
    try {
      if (baseUrl != null) {
        _dio.options.copyWith(baseUrl: baseUrl);
      }
      final response = await _dio.delete(endpoint, queryParameters: params, cancelToken: cancelToken, options: Options(headers: headers));
      return _handleApiResponse(response: response);
    } on DioException catch (e) {
      logger.e('\n\n${e.response?.statusCode}\n\n');
      logger.e('\n\n${e.response?.statusMessage}\n\n');
      return _handleApiResponse(exception: e);
    } catch (e) {
      logger.e('\n\n${e.toString()}\n\n');
      return {
        'error': null,
        'message': e.toString()
      };
    }
  }

  @override
  Future<Map<String, dynamic>?> getHttp(String endpoint, {Map<String, dynamic>? params, Map<String, dynamic>? headers, String? baseUrl, CancelToken? cancelToken}) async {
    logger.i('\n getHttp: $endpoint params: ${params.toString()}\n');
    if (endpoint.isValidUrlEndpoint()) throw const ArgumentError('getHttp Endpoint invalid');
    try {
      if (baseUrl != null) {
        _dio.options.copyWith(baseUrl: baseUrl);
      }
      final response = await _dio.get(endpoint, queryParameters: params, cancelToken: cancelToken, options: Options(headers: headers));
      return _handleApiResponse(response: response);
    } on DioException catch (e) {
      logger.e('\n\ngetHttp: ${e.response?.statusCode}\n\n');
      logger.e('\n\ngetHttp: ${e.response?.statusMessage}\n\n');
      return _handleApiResponse(exception: e);
    } catch (e) {
      logger.e('\n\ngetHttp: ${e.toString()}\n\n');
      return {
        'error': null,
        'message': e.toString()
      };
    }
  }

  @override
  Future<Map<String, dynamic>?> postHttp(String endpoint, {body, Map<String, dynamic>? params, Map<String, dynamic>? headers, String? baseUrl, CancelToken? cancelToken}) async {
    logger.i('\n postHttp $endpoint params: ${params.toString()}\n');
    if (endpoint.isValidUrlEndpoint()) throw const ArgumentError('postHttp Endpoint invalid');
    try {
      if (baseUrl != null) {
        _dio.options.copyWith(baseUrl: baseUrl);
      }
      final response = await _dio.post(endpoint, queryParameters: params, cancelToken: cancelToken, options: Options(headers: headers));
      return _handleApiResponse(response: response);
    } on DioException catch (e) {
      logger.e('\n\npostHttp: ${e.response?.statusCode}\n\n');
      logger.e('\n\npostHttp: ${e.response?.statusMessage}\n\n');
      return _handleApiResponse(exception: e);
    } catch (e) {
      logger.e('\n\npostHttp: ${e.toString()}\n\n');
      return {
        'error': null,
        'message': e.toString()
      };
    }
  }

  @override
  Future<Map<String, dynamic>?> putHttp(String endpoint, {body, Map<String, dynamic>? params, Map<String, dynamic>? headers, String? baseUrl, CancelToken? cancelToken}) async {
    logger.i('\n putHttp $endpoint params: ${params.toString()}\n');
    if (endpoint.isValidUrlEndpoint()) throw const ArgumentError('putHttp Endpoint invalid');
    try {
      if (baseUrl != null) {
        _dio.options.copyWith(baseUrl: baseUrl);
      }
      final response = await _dio.put(endpoint, queryParameters: params, cancelToken: cancelToken, options: Options(headers: headers));
      return _handleApiResponse(response: response);
    } on DioException catch (e) {
      logger.e('\n\nputHttp: ${e.response?.statusCode}\n\n');
      logger.e('\n\nputHttp: ${e.response?.statusMessage}\n\n');
      return _handleApiResponse(exception: e);
    } catch (e) {
      logger.e('\n\nputHttp: ${e.toString()}\n\n');
      return {
        'error': null,
        'message': e.toString()
      };
    }
  }

  Map<String, dynamic> _handleApiResponse({Response? response, DioException? exception}) {

    if (response == null) {
      return {
        'error': exception?.type.name,
        'message': exception?.response?.statusMessage ?? exception?.message
      };
    }

    if(response.statusCode! / 200 >= 1 && response.statusCode! / 200 < 1.5) {
      if (response.data is Map && (response as Map).containsKey('data')) {
        return response.data as Map<String, dynamic>;
      }
      return {'data': response.data};
    }

    Map<String, dynamic> errorResult = {};

    if (response.data is Map) {
      errorResult = {
        'message': 'API ${response.data['message']}',
        'data': response.data['data'],
      };
    } else {
      errorResult = {
        'message': 'Something went wrong while getting response',
        'data': response.data,
      };
    }

    // TODO: handle code with backend codes
    if (response.data['code'] is int) {
      switch (response.data['code'] as int) {
        case 400:
          errorResult['error'] = ApiErrors.badRequest;
      }
    }

    return errorResult;
  }

}