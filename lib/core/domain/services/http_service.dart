import 'package:dio/dio.dart';

// abstract class DioService {
//   Dio getDio();
// }

abstract class HttpService {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
}
