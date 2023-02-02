// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings

// import 'dart:async';
import 'dart:async';

import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/models/redirects.dart';
import 'package:al_sahabah/screens/prayer_time.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flip_board/flip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Event> events = [];
  void getEvents() async {
    try {
      var response =
          await Dio().get('http://52.90.175.175/api/events/get?page=1');
      setState(() {
        events = (response.data["data"]["data"] as List)
            .map((i) => Event.fromJson(i))
            .toList();
      });
    } catch (e) {
      null;
    }
  }

  Dio dio = Dio();
  static List<PrayerTimeClass> prayerTime = [];
  String currentDate = "";
  var time = DateTime.now();
  String? cPrayerName;

  Future fetchPrayerTime() async {
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString().padLeft(2, '0');
    String day = DateTime.now().day.toString().padLeft(2, '0');
    var time = DateTime.now();
    setState(() {
      currentDate = "$year-$month-$day";
    });

    // include current data in admin panel $currentDate
    Response response =
        await dio.get("http://52.90.175.175/api/prayer-time/get/2023-02-01");

    if (response.data["data"] != null) {
      setState(() {
        prayerTime.add(PrayerTimeClass.fromJson(response.data["data"]));
      });
    }
  }

  func() {}

  @override
  void initState() {
    Redirects.drawerList();
    getEvents();
    fetchPrayerTime();
    super.initState();
  }

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
      drawer: Builder(
        builder: (context) {
          return FutureBuilder<bool>(
            future: Redirects.drawerList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!
                    ? SignedInStartDrawer(
                        formKey: _formKey,
                        mHeight: mHeight,
                        mWidth: mWidth,
                      )
                    : StartDrawer(
                        formKey: _formKey,
                        mHeight: mHeight,
                        mWidth: mWidth,
                      );
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        },
      ),
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
                      ? SalahTimeRemingWidget(
                          mHeight: mHeight,
                        )
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
            indicatorRadius: 0,
            children: [
              events.isEmpty
                  ? CircularProgressIndicator()
                  : Events(
                      mHeight: mHeight,
                      mWidth: mWidth,
                      image: 'images/event.png',
                      eventDateTime: "${events[0].start} - ${events[0].end}",
                      eventName: events[0].title,
                    ),
              events.isEmpty
                  ? CircularProgressIndicator()
                  : Events(
                      mHeight: mHeight,
                      mWidth: mWidth,
                      image: 'images/prayer.jpg',
                      eventDateTime: "${events[1].start} - ${events[1].end}",
                      eventName: events[1].title,
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

class Event {
  final String title;
  final String start;
  final String end;
  final String description;

  Event(
      {required this.title,
      required this.start,
      required this.end,
      required this.description});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      start: json['start'],
      end: json['end'],
      description: json['description'],
    );
  }
}

// class User {
//   int id;
//   String name;
//   String email;
//   String image;

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.image,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json["id"] ?? "",
//       name: json["name"] ?? "",
//       email: json["email"] ?? "",
//       image: json["image"] ?? "",
//     );
//   }
// }
