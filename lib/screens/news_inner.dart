import 'package:al_sahabah/const/const.dart';
import 'package:flutter/material.dart';

class NewsInnerScreen extends StatefulWidget {
  String title;
  String date;
  String image;
  String content;
  NewsInnerScreen({
    super.key,
    required this.title,
    required this.date,
    required this.image,
    required this.content,
  });

  @override
  State<NewsInnerScreen> createState() => _NewsInnerScreenState();
}

class _NewsInnerScreenState extends State<NewsInnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.darken),
                      image: NetworkImage(widget.image),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(
                      widget.title,
                      style: news_inner_screen_title_tstyle,
                    ),
                    subtitle: Text(
                      widget.date,
                      style: news_inner_screen_date_tstyle,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(widget.content),
            )
          ],
        ),
      ),
    );
  }
}
