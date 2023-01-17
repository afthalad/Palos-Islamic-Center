import 'package:al_sahabah/const/const.dart';
import 'package:flutter/material.dart';

class NewsInnerScreen extends StatefulWidget {
  const NewsInnerScreen({super.key});

  @override
  State<NewsInnerScreen> createState() => _NewsInnerScreenState();
}

class _NewsInnerScreenState extends State<NewsInnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: const Text('News'),
      ),
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
                      image:  NetworkImage(news_inner_screen_image
                          ),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(
                     news_inner_screen_title,
                      style: news_inner_screen_title_tstyle,
                    ),
                    subtitle: Text(
                     news_inner_screen_date,
                      style: news_inner_screen_date_tstyle,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                  news_inner_screen_news),
            )
          ],
        ),
      ),
    );
  }
}
