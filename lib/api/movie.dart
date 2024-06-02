import '../utils/request.dart';
import 'package:flutter_mvvm/model/movie_model.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class MovieApi {
  //获取电影列表, future为实现非同步操作
  static Future<List<MovieModel>> getMovies(Map<String, dynamic> param) async {
    final res =  await Request().get(
      "/",
      param: param,
    );
    final body = res;
    final Iterable json = body["Search"];
    List<MovieModel> list = json.map((movie) => MovieModel.fromJson(movie)).toList();
    return list;
  }

// Future<List<MovieModel>> getMovies(String keyword) async {
//   List<MovieModel> list = [];
//   try {
//     final res = await http.get(Uri.parse('http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538'));
//     if (res.statusCode == 200) {
//       final body = jsonDecode(res.body); //res.data为_Map<String, dynamic>
//       final Iterable json = body["Search"];
//       //格式化数据, 循环执行
//       list = json.map((movie) => MovieModel.fromJson(movie)).toList();
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