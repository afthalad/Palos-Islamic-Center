import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/news_inner.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:html/parser.dart';

// News Screen
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Dio dio = Dio();
  List<News> news = [];

  Future<void> fetchNewss() async {
    Response response =
        await dio.get("http://52.90.175.175/api/news/get?page=1");

    var data = response.data["data"]["data"] as List;
    print(data);
    setState(() {
      news = data.map((d) => News.fromJson(d)).toList();
    });
    print(news);
  }

  @override
  void initState() {
    fetchNewss();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: const Text('News'),
      ),
      body: Column(
        children: [
          ImageSlideshow(
            children: [
              NewsSlideWidget0(news: news),
              NewsSlideWidget1(news: news),
            ],
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(news_screen_title, style: news_screen_title_tstyle),
            subtitle: Text(news_screen_subtitle),
          ),
          news.isEmpty
              ? const CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsInnerScreen(
                                  title: news[i].title,
                                  date: news[i].date,
                                  image: news[i].images[0],
                                  content: parse(news[i].content).body!.text,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.black12, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            title: Text(
                              news[i].title,
                              style: news_list_tile_widget_title_tstyle,
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  parse(news[i].content).body!.text,
                                  maxLines: 2,
                                  style: news_slide_widget_description_tstyle,
                                ),
                                Text(
                                  news[i].date,
                                  style: news_slide_widget_date_tstyle,
                                ),
                              ],
                            ),
                            trailing: ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 100,
                                minHeight: 300,
                                maxWidth: 104,
                                maxHeight: 300,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    news[i].images[0],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                      ;
                    },
                  ),
                ),
        ],
      ),
    );
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
