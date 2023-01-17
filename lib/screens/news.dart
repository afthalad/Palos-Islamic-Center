import 'package:al_sahabah/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

// News Screen
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: const Text('News'),
      ),
      body: Column(
        children: [
          ImageSlideshow(
            children: List.generate(
              5,
              (counter) => const NewsSlideWidget(),
            ),
          ),
          const ListTile(
            tileColor: Colors.white,
            title: Text(
              'Recent News',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Stay up to date with the latest news and events'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return NewsListtileWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
