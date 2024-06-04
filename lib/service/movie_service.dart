import 'package:flutter/foundation.dart';
import '../utils/request.dart';
import 'package:flutter_mvvm/model/movie_model.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class MovieService {
  //获取电影列表, future为实现非同步操作
  static Future<List<Movie>> getMovies(Map<String, dynamic> params) async {
    List<Movie> list = [];
    final res =  await Request().get(
      "/",
      params: params,
    );
    final Iterable json = res["Search"];
    list = json.map((movie) => Movie.fromJson(movie)).toList();
    return list;
  }

// Future<List<Movie>> getMovies(String keyword) async {
//   List<Movie> list = [];
//   try {
//     final res = await http.get(Uri.parse('http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538'));
//     if (res.statusCode == 200) {
//       final body = jsonDecode(res.body); //res.data为_Map<String, dynamic>
//       final Iterable json = body["Search"];
//       //格式化数据, 循环执行
//       list = json.map((movie) => Movie.fromJson(movie)).toList();
//       // if (kDebugMode) {
//       //   print(list);
//       // }
//     }
//   } on DioException catch(e) {
//     debugPrint(e.message);
//     throw Exception(e.message);
//   }
//   return list;
// }
}