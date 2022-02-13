import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _movieRepository;

  MovieController(this._movieRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  Movies? _cachedMovies;

  onChanged(String value) {
    List<Movie> list = _cachedMovies!.listMovies
        .where((e) => e.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();

    movies.value = movies.value!.copyWith(listMovies: list);
  }

  fetch() async {
    movies.value = await _movieRepository.getMovies();
    _cachedMovies = movies.value;
  }
}
