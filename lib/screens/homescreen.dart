// ignore_for_file: no_leading_underscores_for_local_identifiers

// import 'dart:async';
import 'dart:async';

import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:flip_board/flip_widget.dart';
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
    var spinController = StreamController<int>.broadcast();
    bool containerClicked = false;
    int nextSpinValue = 0;
    int? widgetIndex = 0;

    void spin() => spinController.add(++nextSpinValue);
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
          FlipWidget(
            initialValue: nextSpinValue,
            itemStream: spinController.stream,
            flipType: FlipType.spinFlip,
            itemBuilder: (_, index) {
              return GestureDetector(
                  onTap: (() async {
                    if (!containerClicked) {
                      containerClicked = true;
                      widgetIndex = index as int?;
                      if (widgetIndex! < 2) {
                        spin();
                      } else {
                        nextSpinValue = 0;
                        spinController.add(nextSpinValue);
                      }
                      await Future.delayed(const Duration(milliseconds: 500));
                      containerClicked = false;
                    }
                  }),
                  child: index == 0
                      ? SalahTimeRemingWidget(mHeight: mHeight)
                      : index == 1
                          ? MSalahTime(mHeight: mHeight, mWidth: mWidth)
                          : JummahPrayerTimesWidget(mHeight: mHeight));
            },
            flipDirection: AxisDirection.up,
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

class JummahPrayerTimesWidget extends StatelessWidget {
  const JummahPrayerTimesWidget({
    Key? key,
    required this.mHeight,
  }) : super(key: key);

  final double mHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mHeight * 0.11,
      color: mSalah_time_container_color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Dars Al Jumah", style: mSalah_time_title_tstyle),
                    Text("11.30 am", style: mSalah_time_subtitle_tstyle),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("First khutbah", style: mSalah_time_title_tstyle),
                    Text("12.00 pm", style: mSalah_time_subtitle_tstyle),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("second khutbah", style: mSalah_time_title_tstyle),
                    Text("01.30 pm", style: mSalah_time_subtitle_tstyle),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
