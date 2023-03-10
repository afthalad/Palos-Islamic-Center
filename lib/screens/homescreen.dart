// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings

// import 'dart:async';
import 'dart:async';
import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/features_from_api.dart';
import 'package:al_sahabah/services/redirects.dart';
import 'package:al_sahabah/screens/prayer_time.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flip_board/flip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Timer? _timer;

  var cPrayerName = "";
  String cPrayerTime = "12:00 PM"; // this line changed
  var remingTime;

  List<PrayerTimeClass> prayerTime = [];
  List<PrayerTimeClass> prayerTimeNexDay = [];
  List<String> headerImages = [];
  List<Event> events = [];
  var liveStreamUrl = "";
  var spinController = StreamController<int>.broadcast();
  List<dynamic> features = [];
  void spin() => spinController.add(++nextSpinValue);

  void eventsGet() async {
    try {
      var response =
          await Dio().get('http://52.90.175.175/api/events/get?page=1');
      setState(() {
        events = (response.data["data"]["data"] as List)
            .map((i) => Event.fromJson(i))
            .toList();
      });
      // print(events.length);
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
    if (!mounted) return;
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
            .format(nextDayFajirTime.add(Duration(days: 1)));
        remingTime =
            await (nextDayFajirTime.add(Duration(days: 1))).difference(now);
      }
<<<<<<< HEAD

      // print(cPrayerName);
      // print(cPrayerTime);
      // print(remingTime);
=======
>>>>>>> b5e6dd0620920c0ad0f7bcf879c5a7707ad45e40
    } else {}
  }

  String convertTo12HourFormat(String time24) {
    final time24Hour = DateFormat('HH:mm').parse(time24);
    return DateFormat('h:mm a').format(time24Hour);
  }

  Future<List<Feature>> fetchFeaturesData() async {
    const String apiUrl = 'http://52.90.175.175/api/pages/get';

    try {
      final response = await Dio().get(apiUrl);
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        setState(() {
          features.addAll(data.map((i) => Feature.fromJson(i)).toList());
        });
        // print(features.length);

        return data.map((feature) => Feature.fromJson(feature)).toList();
      } else {
        throw Exception('Failed to load features data');
      }
    } catch (error) {
      // print(error);
      throw Exception('Failed to load features data: $error');
    }
  }

  List<List<T>> chunk<T>(List<T> list, int chunkSize) {
    return List.generate((list.length / chunkSize).ceil(), (i) {
      int start = i * chunkSize;
      int end = (i + 1) * chunkSize;
      return list.sublist(start, end < list.length ? end : list.length);
    });
  }

  @override
  void initState() {
    Redirects.drawerList();
    prayerTimeGet();
    fetchFeaturesData().then((data) {
      setState(() {
        features = data;
      });
    });

    headerImageGet();
    eventsGet();
    print(events.length);
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>();
    var spinController = StreamController<int>.broadcast();
    int nextSpinValue = 0;

    void spin() => spinController.add(++nextSpinValue);
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (nextSpinValue >= 3) {
        nextSpinValue = 0;
      }
      spin();
    });

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Row(children: [
            Container(
              width: 55,
              height: 40,
              child: Image(
                image: AssetImage("images/stg.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text('STG Masjid'),
            ),
          ]),
        ),
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: RefreshIndicator(
          displacement: 150,
          backgroundColor: Colors.white,
          color: Color.fromARGB(255, 40, 42, 70),
          strokeWidth: 3,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () async {
            await Future.delayed(Duration(milliseconds: 1000));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => super.widget));
          },
          child: SingleChildScrollView(
            child: Column(
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
                                    jummahTime: prayerTime.isEmpty
                                        ? "Loading...."
                                        : convertTo12HourFormat(
                                            prayerTime[0].dhuhar),
                                  )
                                : SalahTimeRemingWidget(
                                    mHeight: mHeight,
                                    cPrayerName: cPrayerName,
                                    cPrayerTime: DateFormat('h:mm a').format(
                                        DateFormat('HH:mm').parse(cPrayerTime)),
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
                            image: events[0].image,
                            eventDateTime: DateFormat('yyyy-MM-dd hh:mm a')
                                .format(DateFormat('yyyy-MM-dd hh:mm:ss')
                                    .parse(events[0].start)),
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
                            image: events[1].image,
                            eventDateTime: DateFormat('yyyy-MM-dd hh:mm a')
                                .format(DateFormat('yyyy-MM-dd hh:mm:ss')
                                    .parse(events[1].start)),
                            eventName: events[1].title,
                          ),
                  ],
                ),
                ImageSlideshow(
                  height: mHeight * 0.25,
                  width: double.infinity,
                  indicatorColor: Colors.grey,
                  indicatorBackgroundColor: Colors.white,
                  isLoop: false,
                  children: [
                    MFeaturesCard1(mWidth: mWidth, mHeight: mHeight),
                    ...chunk(features, 6).map(
                      (featureChunk) => SizedBox(
                        height: mHeight * 0.244, // specify a fixed height
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio:
                                      1.32 // set the spacing between rows
                                  ),
                          itemCount: featureChunk.length,
                          itemBuilder: (context, index) {
                            final feature = featureChunk[index];
                            return InkWell(
                              onTap: () async {
                                if (await feature.is_external_link == 1) {
                                  launchUrl(Uri.parse(feature.url));
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FeaturesFromApi(
                                        appBarTitle: feature.page_name,
                                        pageText: feature.description,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: FeaturesCardFromAdmin(
                                featuresTitle: feature.page_name,
                                mHeight: mHeight,
                                mWidth: mWidth,
                                featuresIcon: feature.imageUrl,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ContactUsSocial(
                      image: "images/icon-facebook.png",
                      title: "",
                      link: m_features_card2_facebook_web_url,
                    ),
                    ContactUsSocial(
                      image: "images/icon-youtube..png",
                      title: "",
                      link: m_features_card2_youtube_web_url,
                    ),
                    ContactUsSocial(
                      image: "images/icon-instagram.png",
                      title: "",
                      link: m_features_card2_instagram_web_url,
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/live_stream_screen');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              child: Image(
                                image: AssetImage("images/icons-youtube.png"),
                              ),
                            ),
                            Text("")
                          ],
                        ),
                      ),
                    ),

                    // ContactUsSocial(),
                    // ContactUsSocial(),
                    // ContactUsSocial(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Event {
  final String title;
  final String start;
  final String end;
  final String description;
  final String image;

  Event({
    required this.title,
    required this.start,
    required this.end,
    required this.description,
    required this.image,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      start: json['start'],
      end: json['end'],
      description: json['description'],
      image: json['image'],
    );
  }
}

class Feature {
  final String imageUrl;
  final String page_name;
  final String description;
  final int is_external_link;
  final String url;

  Feature({
    required this.page_name,
    required this.description,
    required this.imageUrl,
    required this.is_external_link,
    required this.url,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      page_name: json['page_name'],
      description: json['description'],
      imageUrl: json['image'],
      is_external_link: json['is_external_link'],
      url: json['url'],
    );
  }
}
