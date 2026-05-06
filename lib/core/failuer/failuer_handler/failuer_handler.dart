 import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meadowkart_task/core/failuer/error_response/error_response.dart';

ErrorResponse checkResponseError(DioException err) {
    final statusCode = err.response?.statusCode ?? 0;
    var errorData = err.response?.data;

    // JSON error response \\
    if (errorData is Map<String, dynamic>) {
      return ErrorResponse.fromJson(errorData);

      // Server error Response \\
    } else if (errorData is String) {
      return ErrorResponse(
        status: statusCode,
        message: _getDefaultMessageForStatusCode(statusCode),
      );
    } else {
      return ErrorResponse(
        status: statusCode,
        message: 'An error occurred. Please try again.',
      );
    }
  }

  // Mapping known server HTML error responses to user-friendly messages \\
  String _getDefaultMessageForStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Invalid request. Please check your input.';
      case 401:
        return 'Invalid credentials. Please try again.';
      case 403:
        return 'Access denied. Please contact support.';
      case 404:
        return 'Request failed. Please check your input or try again.';
      case 408:
        return 'Request timeout. Please try again later.';
      case 500:
        return 'Server error. Please try again later.';
      case 502:
        return 'Bad gateway. Please try again later.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'Something went wrong. Please try again later.';
    }
  }

  // Helper method to handle all types of errors including timeouts \\
  ErrorResponse handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ErrorResponse(
            message: 'No internet connection. Please check your network.',
            status: 408,
          );
        case DioExceptionType.sendTimeout:
          return ErrorResponse(
            message: 'Request timeout. The server took too long to respond.',
            status: 408,
          );
        case DioExceptionType.receiveTimeout:
          return ErrorResponse(
            message:
                'Response timeout. The server is taking too long to send data.',
            status: 408,
          );
        case DioExceptionType.connectionError:
          return ErrorResponse(
            message: 'No internet connection. Please check your network.',
            status: 0,
          );
        case DioExceptionType.badResponse:
          return checkResponseError(error);
        case DioExceptionType.cancel:
          return ErrorResponse(
            message: 'Request was cancelled.',
            status: 0,
          );
        case DioExceptionType.unknown:
          return ErrorResponse(
            message: 'An unknown error occurred. Please try again.',
            status: 0,
          );
        default:
          return ErrorResponse(
            message: 'An error occurred. Please try again.',
            status: 0,
          );
      }
    } else if (error is SocketException) {
      return ErrorResponse(
        message: 'No internet connection. Please check your network.',
        status: 0,
      );
    } else {
      return ErrorResponse(
        message: 'An unexpected error occurred. Please try again.',
        status: 0,
      );
    }
  }