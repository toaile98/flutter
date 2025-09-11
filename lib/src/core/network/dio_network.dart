import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/core/utils/constant/flavor_config.dart';
import 'package:flutter_base/src/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import '../../shared/data/data_sources/app_shared_prefs.dart';
import '../helper/helper.dart';
import '../utils/injections.dart';
import '../utils/log/app_logger.dart';
import 'logger_interceptor.dart';

class DioNetwork {
  static late Dio appAPI;
  static late Dio retryAPI;

  static Future<void> initDio() async {
    appAPI = Dio(await baseOptions(FlavorConfig.instance.apiUrl));
    appAPI.interceptors.add(loggerInterceptor());
    appAPI.interceptors.add(appQueuedInterceptorsWrapper());

    retryAPI = Dio(await baseOptions(FlavorConfig.instance.apiUrl));
    retryAPI.interceptors.add(loggerInterceptor());
    retryAPI.interceptors.add(interceptorsWrapper());
  }

  static LoggerInterceptor loggerInterceptor() {
    return LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    );
  }

  ///__________App__________///

  /// App Api Queued Interceptor
  static QueuedInterceptorsWrapper appQueuedInterceptorsWrapper() {
    return QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        // Gắn headers
        final headers = await Helper.getHeaders();
        if (kDebugMode) {
          print("Request Headers: ${json.encode(headers)}");
        }
        options.headers.addAll(headers);
        return handler.next(options);
      },

      onError: (DioException error, handler) async {
        // Nếu lỗi là 401 -> thử refresh token
        if (error.response?.statusCode == 401) {
          try {
            final prefs = sl<AppSharedPrefs>();
            final refreshToken =
                await prefs.getRefreshToken(); // Bạn cần implement hàm này

            if (refreshToken.isNotEmpty) {
              // Gọi API refresh token
              final dio = Dio();
              final refreshResponse = await dio.post(
                "https://api.yourdomain.com/auth/refresh", // API refresh của bạn
                data: {"refresh_token": refreshToken},
              );

              if (refreshResponse.statusCode == 200) {
                final newAccessToken = refreshResponse.data["access_token"];

                // Lưu lại token mới
                prefs.setAccessToken(newAccessToken);

                // Retry request cũ với token mới
                final requestOptions = error.requestOptions;
                requestOptions.headers["Authorization"] =
                    "Bearer $newAccessToken";

                final retryResponse = await dio.fetch(requestOptions);
                return handler.resolve(retryResponse);
              }
            }
          } catch (e) {
            if (kDebugMode) {
              print("Refresh token failed: $e");
            }
            sl<AuthBloc>().add(AuthEvent.logout());
          }
        }

        return handler.next(error);
      },

      onResponse: (response, handler) {
        // Log response nếu cần
        if (kDebugMode) {
          print("Response [${response.statusCode}]: ${response.data}");
        }
        return handler.next(response);
      },
    );
  }

  /// App interceptor
  static InterceptorsWrapper interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {
        Map<String, dynamic> headers = await Helper.getHeaders();

        options.headers = headers;
        appAPI.options.headers = headers;

        return r.next(options);
      },
      onResponse: (response, handler) async {
        if ("${(response.data["code"] ?? "0")}" != "0") {
          return handler.resolve(response);
          // return handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: response, type: DioErrorType.response));
        } else {
          return handler.next(response);
        }
      },
      onError: (error, handler) {
        try {
          return handler.next(error);
        } catch (e) {
          return handler.reject(error);
          // onUnexpectedError(handler, error);
        }
      },
    );
  }

  static Future<BaseOptions> baseOptions(String url) async {
    Map<String, dynamic> headers = await Helper.getHeaders();

    return BaseOptions(
      baseUrl: url,
      validateStatus: (s) {
        return s! < 300;
      },
      headers: headers..removeWhere((key, value) => value == null),
      responseType: ResponseType.json,
    );
  }
}
