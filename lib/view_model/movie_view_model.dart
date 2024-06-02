import 'package:flutter_mvvm/model/movie_model.dart';

//业务处理
class MovieViewModel {
  final MovieModel movie;

  MovieViewModel({required this.movie});

  String get title {
    return this.movie.title;
  }

  String get poster {
    return this.movie.poster;
  }
}