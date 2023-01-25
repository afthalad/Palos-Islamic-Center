// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'dart:math' as math;

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
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: const Text('Palos Islamic Center'),
        actions: <Widget>[
          Builder(
            builder: (BuildContext scaffoldContext) {
              return IconButton(
                icon: const Icon(Icons
                    .notifications_active_rounded), // Replace with your desired icon
                onPressed: () {
                  Scaffold.of(scaffoldContext).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: const EndDrawer(),
      drawer: StartDrawer(formKey: _formKey, mHeight: mHeight, mWidth: mWidth),
      body: Column(
        children: [
          ImageSlideshow(
              width: double.infinity,
              height: mHeight * 0.28,
              initialPage: 0,
              indicatorColor: Colors.grey,
              indicatorBackgroundColor: Colors.white,
              autoPlayInterval: 1500,
              isLoop: true,
              children: [
                Image.network(
                  homescreen_slideshow_image1,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  homescreen_slideshow_image2,
                  fit: BoxFit.cover,
                )
              ]),
          ImageSlideshow(
            height: mHeight * 0.11,
            initialPage: 1,
            autoPlayInterval: 10,
            indicatorRadius: 0,
            isLoop: true,
            children: [
              MSalahTime(mHeight: mHeight, mWidth: mWidth),
              Container(
                padding: const EdgeInsets.all(10),
                height: mHeight * 0.11,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Asr at   03.41 PM',
                          style: mSalah_time_subtitle_tstyle,
                        ),
                        Text(
                          "Remining time 01 : 34 : 02",
                          style: mSalah_time_title_tstyle,
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white30,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/prayer_time_screen");
                        },
                        child: Text(
                          "see more",
                          style: mSalah_time_subtitle_tstyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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
              MFeaturesCard3(mWidth: mWidth, mHeight: mHeight),
            ],
          ),
        ],
      ),
    );
  }
}
