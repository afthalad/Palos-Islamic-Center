// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings

// import 'dart:async';
import 'dart:async';
import 'dart:typed_data';

import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/services/redirects.dart';
import 'package:al_sahabah/screens/prayer_time.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flip_board/flip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool containerClicked = false;
  int nextSpinValue = 0;
  int? widgetIndex = 0;
  Dio dio = Dio();
  String? currentDate;
  String? nextDayDate;

  var cPrayerName = "";
  String cPrayerTime = "00:00:00"; // this line changed
  var remingTime;

  List<PrayerTimeClass> prayerTime = [];
  List<PrayerTimeClass> prayerTimeNexDay = [];
  List<String> headerImages = [];
  List<Event> events = [];
  var spinController = StreamController<int>.broadcast();
  void spin() => spinController.add(++nextSpinValue);

  // Future prayerTImeGet() async {
  //   String year = DateTime.now().year.toString();
  //   String month = DateTime.now().month.toString().padLeft(2, '0');
  //   String day = DateTime.now().day.toString().padLeft(2, '0');
  //   var time = DateTime.now();
  //   setState(() {
  //     currentDate = "$year-$month-$day";
  //   });

  //   // include current data in admin panel $currentDate
  //   Response response =
  //       await dio.get("http://52.90.175.175/api/prayer-time/get/$currentDate");

  //   if (response.data["data"] != null) {
  //     setState(() {
  //       prayerTime.add(PrayerTimeClass.fromJson(response.data["data"]));
  //     });
  //   }
  // }

  void eventsGet() async {
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

  headerImageGet() async {
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

  prayerTimeGet() async {
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString().padLeft(2, '0');
    String day = DateTime.now().day.toString().padLeft(2, '0');
    String nextDay =
        DateTime.now().add(Duration(days: 1)).day.toString().padLeft(2, '0');

    setState(() {
      currentDate = "$year-$month-$day";
      nextDayDate = "$year-$month-$nextDay";
    });

    Response nextDayResponse =
        await dio.get("http://52.90.175.175/api/prayer-time/get/$nextDayDate");
    setState(() {
      prayerTimeNexDay
          .add(PrayerTimeClass.fromJson(nextDayResponse.data["data"]));
    });

    // include current data in admin panel $currentDate
    Response todayResponse =
        await dio.get("http://52.90.175.175/api/prayer-time/get/$currentDate");

    if (todayResponse.data["data"] != null) {
      setState(() {
        prayerTime.add(PrayerTimeClass.fromJson(todayResponse.data["data"]));
      });

      DateTime fajirTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].fajir}");
      DateTime dhuhrTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].dhuhar}");
      DateTime asrTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].asr}");
      DateTime magribTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].magrib}");
      DateTime ishaTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].isha}");
      DateTime nextDayFajirTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTimeNexDay[0].fajir}");
      DateTime now = DateTime.now();

      if (now.isBefore(fajirTime)) {
        cPrayerName = await "Fajr";
        cPrayerTime = await DateFormat.Hms().format(fajirTime);
        remingTime = await fajirTime.difference(now);
      } else if (now.isAfter(fajirTime) && now.isBefore(dhuhrTime)) {
        cPrayerName = await "Duhur";
        cPrayerTime = await DateFormat.Hms().format(dhuhrTime);
        remingTime = await dhuhrTime.difference(now);
      } else if (now.isAfter(dhuhrTime) && now.isBefore(asrTime)) {
        cPrayerName = await "Asr";
        cPrayerTime = await DateFormat.Hms().format(asrTime);
        remingTime = await asrTime.difference(now);
      } else if (now.isAfter(asrTime) && now.isBefore(magribTime)) {
        cPrayerName = await "Magrib";
        cPrayerTime = await DateFormat.Hms().format(magribTime);
        remingTime = await magribTime.difference(now);
      } else if (now.isAfter(magribTime) && now.isBefore(ishaTime)) {
        cPrayerName = await "Isha";
        cPrayerTime = await DateFormat.Hms().format(ishaTime);
        remingTime = await ishaTime.difference(now);
      } else {
        cPrayerName = await "Fajr";
        cPrayerTime = await DateFormat.Hms()
            .format(nextDayFajirTime.add(Duration(hours: 24)));
        remingTime =
            await (nextDayFajirTime.add(Duration(hours: 24))).difference(now);
      }
    } else {}
  }

  @override
  void initState() {
    Redirects.drawerList();
    prayerTimeGet();
    eventsGet();
    headerImageGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>();
    var spinController = StreamController<int>.broadcast();
    int nextSpinValue = 0;

    void spin() => spinController.add(++nextSpinValue);
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (nextSpinValue >= 3) {
        setState(() {
          nextSpinValue = 0;
        });
      }

      spin();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: const Text('Palos Islamic Center'),
        actions: <Widget>[
          SingleChildScrollView(
            child: Builder(
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
          // // ElevatedButton(
          // //     onPressed: () async {
          // //       var result = await FlutterNotificationChannel
          // //           .registerNotificationChannel(
          // //         description: 'My test channel',
          // //         id: 'com.softmaestri.testchannel',
          // //         importance: NotificationImportance.IMPORTANCE_HIGH,
          // //         name: 'afthal',
          // //       );
          // //       print('Result: $result');
          // //     },
          //     child: Text("data")),
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
              return index == 0
                  ? SalahTimeRemingWidget(
                      mHeight: mHeight,
                      cPrayerName: cPrayerName,
                      cPrayerTime: cPrayerTime,
                    )
                  : index == 1
                      ? MSalahTime(mHeight: mHeight, mWidth: mWidth)
                      : index == 2
                          ? JummahPrayerTimesWidget(
                              mHeight: mHeight,
                              jummahTime: "123",
                            )
                          : SalahTimeRemingWidget(
                              mHeight: mHeight,
                              cPrayerName: cPrayerName,
                              cPrayerTime: cPrayerTime,
                            );
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
