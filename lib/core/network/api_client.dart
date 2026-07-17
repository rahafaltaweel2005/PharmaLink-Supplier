import 'package:dio/dio.dart';
import '../constant/api_const.dart';
import '../constant/app_const.dart';
import '../storage/secure_storage_helper.dart';
import 'api_exceptions.dart';

class ApiClient {
  ApiClient._();

  static late final Dio _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await SecureStorageHelper.read(
            key: AppConst.accessTokenKey,
          );
          if (accessToken != null && accessToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            final refreshToken = await SecureStorageHelper.read(
              key: AppConst.refreshTokenKey,
            );
            if (refreshToken == null) {
              return handler.next(error);
            }
            try {
              final response = await _dio.post(
                ApiConst.refreshToken,
                data: {"refreshToken": refreshToken},
              );
              final newAccessToken = response.data['accessToken'];
              final newRefreshToken = response.data['refreshToken'];
              await SecureStorageHelper.write(
                key: AppConst.accessTokenKey,
                value: newAccessToken,
              );
              if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
                await SecureStorageHelper.write(
                  key: AppConst.refreshTokenKey,
                  value: newRefreshToken,
                );
              }
              final options = error.requestOptions;
              options.headers['Authorization'] = 'Bearer $newAccessToken';
              final retryResponse = await _dio.fetch(options);
              return handler.resolve(retryResponse);
            } catch (e) {
              return handler.next(error);
            }
          }
          return handler.next(error);
        },
      ),
    );
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  static Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (error) {
      throw ApiExceptions.handle(error);
    }
  }

  static Future<Response> post({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (error) {
      throw ApiExceptions.handle(error);
    }
  }

  static Future<Response> put({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (error) {
      throw ApiExceptions.handle(error);
    }
  }

  static Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (error) {
      throw ApiExceptions.handle(error);
    }
  }
}
