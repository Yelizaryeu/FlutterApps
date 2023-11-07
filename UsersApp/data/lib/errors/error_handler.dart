import 'package:core/core.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  Future<T> safeDioRequest<T>(Future<T> request) async {
    try {
      return await request;
    } catch (e) {
      throw handleException(e);
    }
  }

  T safeCacheRequest<T>(T request) {
    try {
      return request;
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<Never> handleException(dynamic exception) async {
    if (exception is DioException) {
      final Response<dynamic>? response = exception.response;
      if (response == null) {
        throw Exception();
      } else {
        final int? statusCode = response.statusCode;
        if (statusCode != null) {
          if (statusCode == 400) {
            throw ClientException();
          }

          if (statusCode == 401) {
            throw ClientException();
          }

          if (statusCode >= 500) {
            throw ServerException();
          }
        }

        throw Exception(exception.toString());
      }
    } else {
      throw CacheException();
    }
  }
}
