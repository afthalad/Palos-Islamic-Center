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
                      image: const NetworkImage(
                          'https://muslimnews.co.uk/assets/Palestine-Israeliforces-attack-coffin-of-AlJazeera-journalist-Shireen-Abu-AKleh-E-Jerusalem-13-5-22-shot-dead-by-Israeli-forces-on-may11in-jenin-ph-Mustafa-alkharouf-AA-scaled-513x239.jpg'),
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(
                      'Palestine: 55 Palestinian journalists killed by Israel since 2000',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: Text(
                      '10th Jan 2023',
                      style: TextStyle(color: Colors.white54),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in vulputate nisl. Nam ut feugiat dui. Sed tempor neque sit amet bibendum finibus. Duis id efficitur ante. Etiam mauris tortor, malesuada ac eros at, dictum interdum erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam faucibus vel tortor egestas lacinia. Quisque sed mollis lacus. Morbi luctus, nisl accumsan ornare tincidunt, ex lectus luctus ligula, sed tincidunt turpis nunc eu tellus. Aenean non metus ut diam aliquam sollicitudin. Integer tincidunt lorem purus, sed feugiat nisi tempor et. Suspendisse in magna sed justo consequat placerat. Etiam tellus dui, pharetra nec libero sit amet, commodo aliquam massa. Aliquam erat volutpat.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in vulputate nisl. Nam ut feugiat dui. Sed tempor neque sit amet bibendum finibus. Duis id efficitur ante. Etiam mauris tortor, malesuada ac eros at, dictum interdum erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam faucibus vel tortor egestas lacinia. Quisque sed mollis lacus. Morbi luctus, nisl accumsan ornare tincidunt, ex lectus luctus ligula, sed tincidunt turpis nunc eu tellus. Aenean non metus ut diam aliquam sollicitudin. Integer tincidunt lorem purus, sed feugiat nisi tempor et. Suspendisse in magna sed justo consequat placerat. Etiam tellus dui, pharetra nec libero sit amet, commodo aliquam massa. Aliquam erat volutpat.\n\n"),
            )
          ],
        ),
      ),
    );
  }
}
