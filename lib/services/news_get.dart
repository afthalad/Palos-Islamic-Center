import 'package:dio/dio.dart';

class NewsGet {
  Dio dio = Dio();
  List<News> news = [];
  int currentPage = 1;
  static bool isLoading = false;

  fetchNewss() async {
    Response response =
        await dio.get("http://52.90.175.175/api/news/get?page=$currentPage");

    var data = response.data["data"]["data"] as List;

    news.addAll(data.map((i) => News.fromJson(i)).toList());
  }

  void loadNextPage() {
    currentPage++;
    fetchNewss();
    // print(currentPage);
  }
}

class News {
  String title;
  String content;
  List<dynamic> images;
  String date;

  News({
    required this.title,
    required this.content,
    required this.images,
    required this.date,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json["title"] ?? "",
      content: json["content"] ?? "",
      images: json["images"] ?? "",
      date: json["date"] ?? "",
    );
  }
}
