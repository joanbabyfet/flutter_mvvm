import 'package:flutter/material.dart';
import 'package:flutter_mvvm/api/movie.dart';
import 'package:flutter_mvvm/view_model/movie_view_model.dart';

//业务处理
class MovieListViewModel extends ChangeNotifier {

  //List<MovieViewModel> movies = List<MovieViewModel>(); //该旧写法会报错
  List<MovieViewModel> movies = List<MovieViewModel>.empty();

  //获取视频列表, 调用方
  Future<void> getMovies(String keyword) async {
    //组装数据
    Map<String, dynamic> param = {
      's': keyword,
      'apikey': 'eb0d5538',
    };
    final results =  await MovieApi.getMovies(param);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners(); //告诉provider控制器数据已被更新
  }
}