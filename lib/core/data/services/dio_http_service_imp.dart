import 'package:dio/dio.dart';
import 'package:movie_app/core/domain/services/http_service.dart';

class DioHttpServiceImp implements HttpService {
  late Dio _dio;

  DioHttpServiceImp() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OGU4NjE2OGUwYWE3YWRhZTcyMWRiYzE2M2M1NDliOSIsInN1YiI6IjYxZmNhYTU2ZWVlMTg2MDA5MTFkM2NmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-lMIpRjCF-PdWBHd9rsJKUSk2QVY6KLKHubZ72Qo_4Q',
        },
      ),
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }
}
