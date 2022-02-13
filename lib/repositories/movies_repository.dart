import 'package:movie_app/model/movies_model.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies();
}
