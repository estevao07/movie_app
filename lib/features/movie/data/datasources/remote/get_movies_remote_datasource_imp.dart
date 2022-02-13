import 'package:dartz/dartz.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/apis_utils.dart';
import 'package:movie_app/features/movie/data/datasources/get_movies_datasource.dart';
import 'package:movie_app/features/movie/data/dtos/movie_dto.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

class GetMoviesRemoteDatasourceImp implements GetMoviesDataSource {
  final HttpService _httpService;
  GetMoviesRemoteDatasourceImp(this._httpService);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      var result = await _httpService.get(API.requestMovieList);
      return Right(MovieDto.fromJson(result.data));
    } catch (e) {
      return Left(Exception('Falha no datasource'));
    }
  }
}
