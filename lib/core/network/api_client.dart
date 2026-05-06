import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meadowkart_task/core/network/dio_client.dart';

// Api Client Provider
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.read(dioProvider));
});

class ApiClient {
  final DioClient dioClient;

  ApiClient(this.dioClient);

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) {
    return dioClient.dio.get(path, queryParameters: queryParams);
  }

  Future<Response> post(String path, {dynamic data}) {
    return dioClient.dio.post(path, data: data);
  }
}