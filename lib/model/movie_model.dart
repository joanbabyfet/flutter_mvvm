//API返回的数据结构模型
class MovieModel {
  final String title; //标题(必填)
  final String poster; //封面图(必填)

  MovieModel({required this.title, required this.poster});

  //格式化数据只取2个字段
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        title: json["Title"],
        poster: json["Poster"]
    );
  }
}