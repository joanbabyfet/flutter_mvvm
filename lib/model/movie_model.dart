//API返回的数据结构模型
class Movie {
  final String title; //标题(必填)
  final String poster; //封面图(必填)

  Movie({required this.title, required this.poster});

  //格式化数据只取2个字段
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    title: json["Title"],
    poster: json["Poster"]
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "poster": poster,
  };
}