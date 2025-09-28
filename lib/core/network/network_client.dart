import 'dart:io';
import 'package:dio/dio.dart';
import '../error/error_handler.dart';
import '../error/exceptions.dart';

class NetworkClient {
  final Dio _dio;
  final String apiKey;
  final String baseUrl;
  final String imageBaseUrl;

  NetworkClient({
    this.apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZWJlNzYxYmI3YTVlY2NhZWI2NGViOGFmMTA4NDA1YyIsIm5iZiI6MTY2MzM1NzI1Ny43NDUsInN1YiI6IjYzMjRkMTQ5OGM3YjBmMDA5MDEzYTAyNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xOHPasWQjwVB6hcDNosD2FGomOA7wBV2ICg6OTc6RBQ',
    Dio? dio,
    this.baseUrl = 'https://api.themoviedb.org/3/',
    this.imageBaseUrl = 'https://image.tmdb.org/t/p/',
  }) : _dio = dio ??
      Dio(BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
      )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters = {
          ...options.queryParameters,
          'api_key': apiKey,
        };
        options.queryParameters.putIfAbsent('language', () => 'en-US');
        options.headers.putIfAbsent('Accept', () => 'application/json');
        handler.next(options);
      },
      onError: (err, handler) {
        final ex = ErrorHandler.handleDioException(err);
        handler.reject(DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: ex,
        ));
      },
    ));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final res = await _dio.get(path, queryParameters: queryParameters);
      final status = res.statusCode ?? 500;
      if (status < 200 || status >= 300) {
        throw ErrorHandler.fromResponse(res);
      }
      return res;
    } on DioException catch (dioErr) {
      final e = dioErr.error;
      if (e is Exception) throw e;
      throw ServerException(dioErr.message ?? "Unexpected DioException");
    } on SocketException {
      throw NetworkException("No internet");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  String imageUrl(String size, String path) {
    if (path.startsWith('/')) {
      return '$imageBaseUrl$size$path';
    } else {
      return '$imageBaseUrl$size/$path';
    }
  }
}
