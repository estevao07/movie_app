import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';
import 'package:movie_app/service/dio_service.dart';
import 'package:movie_app/utils/apis_utils.dart';

class MoviesRepositoyImp implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoyImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    await Future.delayed(const Duration(seconds: 3));
    var result = await _dioService.getDio().get(API.requestMovieList);

    return Movies.fromJson(result.data);
  }
}
