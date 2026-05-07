import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meadowkart_task/core/endpoints/api_endpoints.dart';


// Dio Client Provider
final dioProvider = Provider<DioClient>((ref) {
  return DioClient();
});


class DioClient {
  final Dio dio;

  DioClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: ApiEndpoints.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ) {
    dio.interceptors.add(
      AwesomeDioInterceptor(
       logRequestHeaders: true,
       logRequestTimeout: true,
       logResponseHeaders: true,
      ),
    );
  }
}