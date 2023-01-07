import 'package:al_sahabah/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.purple,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        title: const Text('Palos Islamic Center'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlideshow(
                width: double.infinity,
                height: mHeight * 0.22,
                initialPage: 0,
                indicatorColor: Colors.grey,
                indicatorBackgroundColor: Colors.white,
                autoPlayInterval: 1500,
                isLoop: true,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1597734187998-e1931acfe2ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFzamlkfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPXlJihD-aeeSlMpTx8NV2rwkPzqw5UANQLHfCv0nmC0sQkCRkrSe6fXHSqjV2wm8NgA8&usqp=CAU',
                    fit: BoxFit.cover,
                  )
                ]),
            MSalahTime(mHeight: mHeight, mWidth: mWidth),
            ImageSlideshow(
              height: mHeight * 0.2,
              width: double.infinity,
              initialPage: 0,
              indicatorColor: Colors.grey,
              indicatorBackgroundColor: Colors.white,
              // autoPlayInterval: 1500,
              // isLoop: true,
              children: [
                Events(
                  mHeight: mHeight,
                  mWidth: mWidth,
                  image: 'images/event.png',
                  eventDateTime: 'Feb 21, 2018 12.03 am',
                  eventName: 'Poverity sadaqah',
                ),
                Events(
                  mHeight: mHeight,
                  mWidth: mWidth,
                  image: 'images/prayer.jpg',
                  eventDateTime: 'Feb 21, 2018 12.03 am',
                  eventName: 'Friday jummah',
                ),
              ],
            ),
            ImageSlideshow(
              height: mHeight * 0.244,
              width: double.infinity,
              indicatorColor: Colors.grey,
              indicatorBackgroundColor: Colors.white,
              isLoop: false,
              children: [
                MFeaturesCard1(mWidth: mWidth, mHeight: mHeight),
                MFeaturesCard2(mWidth: mWidth, mHeight: mHeight),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
