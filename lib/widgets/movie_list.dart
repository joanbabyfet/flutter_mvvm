import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view_model/movie_view_model.dart';

//展示列表组件
class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;

  MovieList({required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length, //总条数
      itemBuilder: (context, index) {

        final movie = movies[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movie.poster) //封面图
                ),
                borderRadius: BorderRadius.circular(6)
            ),
            width: 50,
            height: 100,
          ),
          title: Text(movie.title), //标题
        );
      },
    );
  }
}