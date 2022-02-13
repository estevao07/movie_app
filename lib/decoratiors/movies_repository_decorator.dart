import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';

abstract class MoviesRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepositoy;

  MoviesRepositoryDecorator(this._moviesRepositoy);

  @override
  Future<Movies> getMovies() async {
    return await _moviesRepositoy.getMovies();
  }
}
