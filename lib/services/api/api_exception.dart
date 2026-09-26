import 'dart:io';
import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => message;

  static ApiException fromDio(DioException error, {bool isLogin = false}) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return ApiException('Connection timed out. Please try again.');
    }
    if (error.type == DioExceptionType.connectionError ||
        error.error is SocketException) {
      return ApiException('Please check your internet connection.');
    }
    if (error.response != null) {
      final statusCode = error.response?.statusCode;
      final data = error.response?.data;
      String? msg;
      if (data is Map && data.containsKey('message')) {
        msg = data['message']?.toString().trim();
      }
      if (statusCode == 401) {
        if (isLogin) {
          return ApiException(
            'Invalid username or password.',
            statusCode: statusCode,
          );
        }
        return ApiException(
          'Session expired or unauthorized. Please log in again.',
          statusCode: statusCode,
        );
      }
      if (statusCode == 404) {
        return ApiException(
          'Requested resource not found.',
          statusCode: statusCode,
        );
      }
      if (statusCode != null && statusCode >= 500) {
        return ApiException(
          'Server error. Please try again later.',
          statusCode: statusCode,
        );
      }
      if (msg != null && msg.isNotEmpty) {
        return ApiException(msg, statusCode: statusCode);
      }
    }
    return ApiException(
      isLogin
          ? 'Invalid username or password.'
          : 'Unable to load customers. Please try again.',
      statusCode: error.response?.statusCode,
    );
  }
}
