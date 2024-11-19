import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../utils/api_constant.dart';
import '../utils/log_print.dart';

class DioService extends GetxService {
  late Dio _dio;

  Dio get dio => _dio;

  @override
  void onInit() async {
    super.onInit();

    _dio = Dio();
    _dio.options = BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Content-Type': 'application/json'},
      validateStatus: (_) => true,
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          LogPrint.info('onRequest triggered');
          LogPrint.info('Request: ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          LogPrint.info('onResponse triggered: ${response.statusCode}');
          return handler.next(response);
        },
        onError: (DioException exception, handler) async {
          LogPrint.info('onError triggered: ${exception.response?.statusCode}');
          if (exception.type == DioExceptionType.connectionTimeout) {
            Get.snackbar('Error', 'Connection Timeout');
          } else if (exception.response?.statusCode == 401) {
            Get.snackbar('Error', 'Unauthorized');
          } else {
            Get.snackbar('Error', handleError(exception));
          }
          return handler.next(exception);
        },
      ),
    );
  }

  String handleError(DioException error) {
    String errorDescription;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorDescription = "Connection Timeout. Please try again later.";
        break;

      case DioExceptionType.sendTimeout:
        errorDescription = "Send Timeout. Please try again later.";
        break;

      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive Timeout. Please try again later.";
        break;

      case DioExceptionType.badResponse:
      // Jika ada response, cek status kode spesifiknya
        final statusCode = error.response?.statusCode;
        if (statusCode != null) {
          if (statusCode == 404) {
            errorDescription = "Resource not found (404).";
          } else if (statusCode == 401) {
            errorDescription = "Unauthorized. Please login again.";
          } else if (statusCode == 500) {
            errorDescription = "Server error (500). Please try again later.";
          } else if (statusCode == 403) {
            errorDescription = "Access forbidden (403). Contact support if needed.";
          } else {
            errorDescription = "Unexpected error: HTTP $statusCode";
          }
        } else {
          // Jika tidak ada status code, artinya ada masalah pada response atau request
          errorDescription = "Unknown response error. Please try again.";
        }
        break;

      case DioExceptionType.cancel:
        errorDescription = "Request to API server was cancelled.";
        break;

      case DioExceptionType.badCertificate:
        errorDescription = "Certificate validation failed. Please check your network security settings.";
        break;

      case DioExceptionType.connectionError:
        errorDescription = "Connection failed due to internet connection.";
        break;

      case DioExceptionType.unknown:
      // Menangani kasus error unknown dan memberikan pesan lebih rinci jika ada
        errorDescription = error.message != null
            ? "An unexpected error occurred: ${error.message}"
            : "An unknown error occurred. Please try again.";
        break;

      default:
        errorDescription = "Unexpected error occurred. Please try again later.";
    }

    return errorDescription;
  }
}
