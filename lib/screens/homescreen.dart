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
  var image;

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
        await dio.get("http://52.90.175.175/api/prayer-time/get/$currentDate");

    if (response.data["data"] != null) {
      setState(() {
        prayerTime.add(PrayerTimeClass.fromJson(response.data["data"]));
      });
    }

    print(prayerTime[0].asr);
  }

  List<String> headerImages = [];
  func() async {
    Response response =
        await dio.get("http://52.90.175.175/api/static-content/header-content");

    if (response.statusCode == 200) {
      var images = response.data['data'];

      images.forEach((image) {
        headerImages.add(image);
      });
    } else {
      throw Exception('Failed to load header images');
    }
  }

  @override
  void initState() {
    Redirects.drawerList();
    getEvents();
    fetchPrayerTime();
    func();
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
        backgroundColor: appBarColor,
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
          Container(
            width: double.infinity,
            height: mHeight * 0.28,
            child: headerImages.isEmpty
                ? const Center(
                    child: Text(
                      "Loading...",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ImageSlideshow(
                    width: double.infinity,
                    height: mHeight * 0.28,
                    initialPage: 0,
                    indicatorColor: Colors.grey,
                    indicatorBackgroundColor: Colors.white,
                    // autoPlayInterval: 1500,
                    // isLoop: true,
                    children: headerImages.map((e) {
                      return Image.network(
                        "http://52.90.175.175/$e",
                        fit: BoxFit.cover,
                      );
                    }).toList()),
          ),
          FlipWidget(
            initialValue: nextSpinValue,
            itemStream: spinController.stream,
            flipType: FlipType.spinFlip,
            itemBuilder: (_, index) {
              return GestureDetector(
                  onTap: (() async {
                    // if (!containerClicked) {
                    //   containerClicked = true;
                    //   // switch (wid) {
                    //   //   case value:
                    //   //     break;
                    //   //   default:
                    //   // }
                    //   widgetIndex = index as int?;
                    //   if (widgetIndex! < 2) {
                    //     spin();
                    //   } else {
                    //     nextSpinValue = 0;
                    //     spinController.add(nextSpinValue);
                    //   }
                    //   await Future.delayed(const Duration(milliseconds: 500));
                    //   containerClicked = false;
                    // }
                    Timer.periodic(Duration(seconds: 5), (timer) async {
                      if (nextSpinValue >= 3) {
                        setState(() {
                          nextSpinValue = 0;
                        });
                      }
                      print(nextSpinValue);
                      spin();

                      // if (!containerClicked) {
                      //   containerClicked = true;
                      //   widgetIndex = (widgetIndex! + 1) % 3;
                      //   if (widgetIndex! < 2) {
                      //     spin();
                      //   } else {
                      //     nextSpinValue = 0;
                      //     spinController.add(nextSpinValue);
                      //   }
                      //   Future.delayed(const Duration(milliseconds: 500));
                      //   containerClicked = false;
                      // }
                    });
                  }),
                  child: index == 0
                      ? SalahTimeRemingWidget(mHeight: mHeight)
                      : index == 1
                          ? MSalahTime(mHeight: mHeight, mWidth: mWidth)
                          : index == 2
                              ? JummahPrayerTimesWidget(mHeight: mHeight)
                              : SalahTimeRemingWidget(mHeight: mHeight));
            },
            flipDirection: AxisDirection.up,
          ),
          // Center(
          //   child: SizedBox(
          //     height: 90,
          //     width: double.infinity,
          //     // constraints: BoxConstraints.tight(size),
          //     child: _buildFlipAnimation(),
          //   ),
          // ),
          // FlipWidget(
          //   initialValue: nextSpinValue,
          //   itemStream: spinController.stream,
          //   flipType: FlipType.spinFlip,
          //   itemBuilder: (_, index) {
          //     return GestureDetector(
          //         onTap: (() async {
          //           if (!containerClicked) {
          //             containerClicked = true;
          //             widgetIndex = index as int?;
          //             if (widgetIndex! < 2) {
          //               spin();
          //             } else {
          //               nextSpinValue = 0;
          //               spinController.add(nextSpinValue);
          //             }
          //             await Future.delayed(const Duration(milliseconds: 500));
          //             containerClicked = false;
          //           }
          //         }),
          //         child: index == 0
          //             ? MSalahTime(mHeight: mHeight, mWidth: mWidth)
          //             : index == 1
          //                 ? MSalahTime(mHeight: mHeight, mWidth: mWidth)
          //                 : index != 0
          //                     ? SalahTimeRemingWidget(
          //                         mHeight: mHeight,
          //                       )
          //                     : MSalahTime(mHeight: mHeight, mWidth: mWidth));
          //   },
          //   flipDirection: AxisDirection.up,
          // ),
          ImageSlideshow(
            height: mHeight * 0.2,
            width: double.infinity,
            initialPage: 0,
            indicatorRadius: 0,
            children: [
              events.isEmpty
                  ? const Center(
                      child: Text(
                        "Loading...",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : Events(
                      mHeight: mHeight,
                      mWidth: mWidth,
                      image: 'images/event.png',
                      eventDateTime: "${events[0].start} - ${events[0].end}",
                      eventName: events[0].title,
                    ),
              events.isEmpty
                  ? const Center(
                      child: Text(
                        "Loading...",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
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
              // MFeaturesCard3(mWidth: mWidth, mHeight: mHeight),
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
