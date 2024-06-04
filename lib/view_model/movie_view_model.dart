import 'package:flutter_mvvm/model/movie_model.dart';

//业务处理
class MovieViewModel {
  final Movie movie;

  MovieViewModel({required this.movie});

  String get title => movie.title;

  String get poster => movie.poster;
}