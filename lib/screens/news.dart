// import 'dart:html';

import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/news_inner.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import 'package:html/dom.dart';

import 'package:html/parser.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// News Screen
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Dio dio = Dio();
  List<News> news = [];
  int currentPage = 1;

  Future<void> fetchNewss() async {
    Response response =
        await dio.get("http://52.90.175.175/api/news/get?page=$currentPage");

    var data = response.data["data"]["data"] as List;

    setState(() {
      news.addAll(data.map((i) => News.fromJson(i)).toList());
    });
  }

  void loadNextPage() {
    setState(() {
      currentPage++;
    });
    fetchNewss();
  }

  @override
  void initState() {
    fetchNewss();
    super.initState();
  }

  int itemsPerPage = 10;

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
          news.length < 2
              ? ImageSlideshow(
                  children: [NewsSlideWidget0(news: news)],
                )
              : ImageSlideshow(
                  children: [
                    NewsSlideWidget0(news: news),
                    NewsSlideWidget1(news: news)
                  ],
                ),
          Container(
            color: Colors.white,
            child: ListTile(
              // selectedTileColor: Colors.white,

              title: Text(news_screen_title, style: news_screen_title_tstyle),
              subtitle: Text(news_screen_subtitle),
            ),
          ),
          news.isEmpty
              ? const CircularProgressIndicator()
              : LazyLoadScrollView(
                  onEndOfPage: () => loadNextPage(),
                  child: Expanded(
                      child: LazyLoadScrollView(
                    onEndOfPage: () =>
                        loadNextPage(), // The callback when reaching the end of the list
                    scrollOffset:
                        10, // Pixels from the bottom that should trigger a callback
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
                            child: SizedBox(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      parse(news[i].content).body!.text,
                                      maxLines: 2,
                                      style:
                                          news_slide_widget_description_tstyle,
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
                          ),
                        );
                        ;
                      },
                    ), // A subclass of `ScrollView`
                  )),
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
