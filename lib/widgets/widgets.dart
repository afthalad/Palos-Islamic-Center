// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/models/auth.dart';
import 'package:al_sahabah/models/prayer_time_by_date.dart';
import 'package:al_sahabah/models/user_get.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/categories_inner.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/faq_inner.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/main.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/my_question.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/question_inner.dart';
import 'package:al_sahabah/screens/about_us.dart';
import 'package:al_sahabah/screens/contact_us.dart';
import 'package:al_sahabah/screens/faq.dart';

import 'package:al_sahabah/screens/news.dart';
import 'package:al_sahabah/screens/news_inner.dart';
import 'package:al_sahabah/screens/newsletter.dart';
import 'package:al_sahabah/screens/screen.dart';
import 'package:al_sahabah/screens/setting.dart';
import 'package:al_sahabah/screens/volunteer_sign_up.dart';
import 'package:al_sahabah/screens/sing_in.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/events.dart';

//Salah Times___
class SalahTime extends StatelessWidget {
  final double mWidth;

  final String? salahImage;
  final String salahTitle;
  final String salahTime;

  const SalahTime({
    Key? key,
    required this.mWidth,
    this.salahImage,
    required this.salahTitle,
    required this.salahTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(salahTitle, style: mSalah_time_title_tstyle),
          Text(salahTime, style: mSalah_time_subtitle_tstyle),
        ],
      ),
    );
  }
}

//Main Salah Time Widget__
class MSalahTime extends StatefulWidget {
  const MSalahTime({
    Key? key,
    required this.mHeight,
    required this.mWidth,
  }) : super(key: key);

  final double mHeight;
  final double mWidth;

  @override
  State<MSalahTime> createState() => _MSalahTimeState();
}

class _MSalahTimeState extends State<MSalahTime> {
  int currentScreen = 1;
  Dio dio = Dio();
  static List<PrayerTimeClass> prayerTime = [];
  static String currentDate = "";

  Future<void> fetchPrayerTime() async {
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString().padLeft(2, '0');
    String day = DateTime.now().day.toString().padLeft(2, '0');

    currentDate = "$year-$month-$day";
//include current date n admin panel
    Response response =
        await dio.get("http://52.90.175.175/api/prayer-time/get/$currentDate");

    if (response.data["data"] != null) {
      setState(() {
        prayerTime.add(PrayerTimeClass.fromJson(response.data["data"]));
      });
    }
  }

  @override
  void initState() {
    fetchPrayerTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.mHeight * 0.11,
      color: mSalah_time_container_color,
      child: Column(
        children: [
          // ElevatedButton(
          //     onPressed: () {
          //       fetchPrayerTime();
          //     },
          //     child: Text("asds")),
          prayerTime.isEmpty
              ? Text("")
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SalahTime(
                      mWidth: widget.mWidth * 0.3,
                      salahTitle: 'Subah',
                      salahTime: prayerTime[0].fajir,
                    ),
                    SalahTime(
                      mWidth: widget.mWidth * 0.3,
                      salahTitle: 'Duhr',
                      salahTime: prayerTime[0].dhuhar,
                    ),
                    SalahTime(
                      mWidth: widget.mWidth * 0.3,
                      salahTitle: 'Asr',
                      salahTime: prayerTime[0].asr,
                    ),
                    SalahTime(
                      mWidth: widget.mWidth * 0.3,
                      salahTitle: 'Magrib',
                      salahTime: prayerTime[0].magrib,
                    ),
                    SalahTime(
                      mWidth: widget.mWidth * 0.3,
                      salahTitle: 'Isha',
                      salahTime: prayerTime[0].isha,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

//Remaining salah time Widget__
class SalahTimeRemingWidget extends StatefulWidget {
  const SalahTimeRemingWidget({
    Key? key,
    required this.mHeight,
  }) : super(key: key);

  final double mHeight;

  @override
  State<SalahTimeRemingWidget> createState() => _SalahTimeRemingWidgetState();
}

class _SalahTimeRemingWidgetState extends State<SalahTimeRemingWidget> {
  Dio dio = Dio();
  static List<PrayerTimeClass> prayerTime = [];
  String currentDate = "";
  var time = DateTime.now();
  String cPrayerName = "";
  var cPrayerTime = "";
  Duration? remingTime;
  var remingTimee;
  Timer? _timer;

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
      prayerTime.add(PrayerTimeClass.fromJson(response.data["data"]));

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
      DateTime now = DateTime.now();

      if (now.isBefore(fajirTime)) {
        setState(() {
          cPrayerName = "Fajr";
          cPrayerTime = DateFormat.Hms().format(fajirTime);
          remingTime = fajirTime.difference(now);
        });
      } else if (now.isAfter(fajirTime) && now.isBefore(dhuhrTime)) {
        setState(() {
          cPrayerName = "Duhur";
          cPrayerTime = DateFormat.Hms().format(dhuhrTime);
          remingTime = dhuhrTime.difference(now);
        });
      } else if (now.isAfter(dhuhrTime) && now.isBefore(asrTime)) {
        setState(() {
          cPrayerName = "Asr";
          cPrayerTime = DateFormat.Hms().format(asrTime);
          remingTime = asrTime.difference(now);
        });
      } else if (now.isAfter(asrTime) && now.isBefore(magribTime)) {
        setState(() {
          cPrayerName = "Magrib";
          cPrayerTime = DateFormat.Hms().format(magribTime);
          remingTime = magribTime.difference(now);
        });
      } else if (now.isAfter(magribTime) && now.isBefore(ishaTime)) {
        setState(() {
          cPrayerName = "Isha";
          cPrayerTime = DateFormat.Hms().format(ishaTime);
          remingTime = ishaTime.difference(now);
        });
      } else {
        setState(() {
          cPrayerName = "Fajr";
          cPrayerTime = DateFormat.Hms().format(fajirTime);
          remingTime = ishaTime.difference(now);
        });
      }
    }
  }

  @override
  void initState() {
    fetchPrayerTime();

    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // remingTimee = parseDuration();
      });
      print(remingTime.runtimeType);
      print(remingTime as Duration);
      print(currentDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: widget.mHeight * 0.11,
      color: mSalah_time_container_color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          remingTime == null
              ? Text("")
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cPrayerName} at  ${cPrayerTime}',
                      style: mSalah_time_subtitle_tstyle,
                    ),
                    Text(
                        remingTime != null
                            ? _timer == null
                                ? '0'
                                : 'Remining time : ${(remingTime!.inHours - _timer!.tick ~/ 3600).toString().padLeft(2, '0')}:${((remingTime!.inMinutes - _timer!.tick ~/ 60) % 60).toString().padLeft(2, '0')}:${(remingTime!.inSeconds - _timer!.tick) % 60}'
                            : "0",
                        style: mSalah_time_title_tstyle),
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
    );
  }
}

//Features Card__
class FeaturesCard extends StatelessWidget {
  final String featuresIcon;
  final String featuresTitle;

  const FeaturesCard({
    Key? key,
    required this.featuresIcon,
    required this.featuresTitle,
    required this.mWidth,
    required this.mHeight,
  }) : super(key: key);

  final double mWidth;
  final double mHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: mWidth * 0.3,
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey[50]!,
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 30,
                child: Image(
                  image: AssetImage(featuresIcon),
                ),
              ),
              Text(
                featuresTitle,
                style: features_title_tstyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}

//1st Main Features Card__
class MFeaturesCard1 extends StatelessWidget {
  const MFeaturesCard1({
    Key? key,
    required this.mWidth,
    required this.mHeight,
  }) : super(key: key);

  final double mWidth;
  final double mHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/masjidh_services_screen');
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon.png',
                featuresTitle: 'Masjidh Service',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/events_screen');
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon-event.png',
                featuresTitle: 'Events',
              ),
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse(m_features_card1_donationt_web_url));
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon-donation.png',
                featuresTitle: 'Donation',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/prayer_time_screen');
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon-time.png',
                featuresTitle: 'Prayer Timings',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/qibla_screen');
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/qibla.png',
                featuresTitle: 'Qibla',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/live_stream_screen');
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icons-youtube.png',
                featuresTitle: 'Live Streaming',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//2nd Main Features Card__
class MFeaturesCard2 extends StatelessWidget {
  MFeaturesCard2({
    Key? key,
    required this.mWidth,
    required this.mHeight,
  }) : super(key: key);

  final double mWidth;
  final double mHeight;
  static const List<Tab> _tabs = [
    Tab(text: 'Categries'),
    Tab(text: 'My Questions'),
    Tab(text: 'FAQ'),
  ];
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                launchUrl(Uri.parse(m_features_card2_facebook_web_url));
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon-facebook.png',
                featuresTitle: 'Facebook',
              ),
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse(m_features_card2_youtube_web_url));
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon-youtube..png',
                featuresTitle: 'Youtube',
              ),
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse(m_features_card2_instagram_web_url));
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon-instagram.png',
                featuresTitle: 'Instagram',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                launchUrl(Uri.parse(m_features_card2_zakath_calulator_web_url));
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon-calculator.png',
                featuresTitle: 'Zakat Calculator',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/news_screen");
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon-news.png',
                featuresTitle: 'News',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AskTheImamScreen(
                      tabs: _tabs,
                      tabController: _tabController,
                    ),
                  ),
                );
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon-quote.png',
                featuresTitle: 'Ask the imam',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MFeaturesCard3 extends StatelessWidget {
  const MFeaturesCard3({
    Key? key,
    required this.mWidth,
    required this.mHeight,
  }) : super(key: key);

  final double mWidth;
  final double mHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/location_prayer_time_screen');
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icons-visit.png',
                featuresTitle: 'Location timing',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//Event card__
class Events extends StatefulWidget {
  const Events({
    Key? key,
    required this.mHeight,
    required this.mWidth,
    required this.image,
    required this.eventDateTime,
    required this.eventName,
  }) : super(key: key);

  final double mHeight;
  final double mWidth;
  final String image;
  final String eventDateTime;
  final String eventName;

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/events_screen');
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Stack(children: [
          Container(
            height: widget.mHeight * 0.3,
            width: widget.mWidth * 1,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                fit: BoxFit.cover,
                image: AssetImage(widget.image),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.eventDateTime,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.eventName,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//Drawer pages__
class DrawerList extends StatelessWidget {
  final String title;
  final Widget? pageWidget;
  final IconData icon;
  const DrawerList({
    Key? key,
    required this.title,
    required this.icon,
    this.pageWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white12, width: 0.5),
        ),
      ),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pageWidget!),
        ),
        title: Text(
          title,
          style: drawer_title_tstyle,
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

//Form Fields__
class FormTextField extends StatelessWidget {
  final String hintText;
  final String validatorText;
  TextEditingController? controller;
  TextInputType? textInputType;

  FormTextField({
    Key? key,
    required this.hintText,
    required this.validatorText,
    this.controller,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorText;
          } else {
            return null;
          }
        },
        decoration: form_field_input_decoration.copyWith(hintText: hintText),
      ),
    );
  }
}

// Prayer Time Table

// Jummah time widget
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

//Notification  Widget
class NotificatonNewsCard extends StatelessWidget {
  const NotificatonNewsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Colors.white10,
        elevation: 0,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.black12,
              ),
            ),
          ),
          child: ListTile(
            leading: Icon(
              Icons.notifications_active_sharp,
              color: sec,
            ),
            title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification_widget_heading,
                    style: notification_widget_heading_tstyle,
                  ),
                  Text(
                    notification_widget_description,
                    style: notification_widget_description_tstyle,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

//End Drawer
class EndDrawer extends StatelessWidget {
  const EndDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: Expanded(
              child: Container(
                margin: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.darken),
                    fit: BoxFit.cover,
                    image: NetworkImage(end_drawer_header_bgimage),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      end_drawer_heading,
                      style: end_drawer_heading_tstyle,
                    ),
                    Text(
                      end_drawer_description,
                      style: end_drawer_description_tstyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const NotificatonNewsCard();
              },
            ),
          )
        ],
      ),
    );
  }
}

// Setting Page Widget__
class SettingOptionWidget extends StatefulWidget {
  final String settingName;
  final String settingSubtitle;
  final IconData settingIcon;
  final Widget? trailingWidget;
  final Widget? pageWidget;
  const SettingOptionWidget({
    Key? key,
    required this.settingName,
    required this.settingSubtitle,
    required this.settingIcon,
    this.pageWidget,
    this.trailingWidget,
  }) : super(key: key);

  @override
  State<SettingOptionWidget> createState() => _SettingOptionWidgetState();
}

class _SettingOptionWidgetState extends State<SettingOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingPagesScreen(
              appBarTitle: widget.settingName,
              pageWidget: widget.pageWidget!,
            ),
          ),
        ),
        leading: Icon(
          widget.settingIcon,
          color: sec,
          size: 35,
        ),
        title: Text(widget.settingName),
        subtitle: Text(
          widget.settingSubtitle,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: widget.trailingWidget,
      ),
    );
  }
}

// Athan Setting Wdget__
class AthanSettings extends StatefulWidget {
  final String name;
  final List<String> dropDownOptions;
  String? dropdownValue;
  AthanSettings({
    required this.name,
    required this.dropDownOptions,
    this.dropdownValue,
    Key? key,
  }) : super(key: key);

  @override
  State<AthanSettings> createState() => _AthanSettingsState();
}

class _AthanSettingsState extends State<AthanSettings> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(10),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width: 63, child: Text(widget.name)),
            DropdownButton<String>(
              value: widget.dropdownValue,
              onChanged: (newValue) {
                setState(() {
                  widget.dropdownValue = newValue!;
                });
              },
              items: widget.dropDownOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ));
  }
}

//Iqamah Setting Widget__
class IqamahSettings extends StatefulWidget {
  final String name;
  final List<String> dropDownOptions;
  String? dropdownValue;
  IqamahSettings({
    required this.name,
    required this.dropDownOptions,
    this.dropdownValue,
    Key? key,
  }) : super(key: key);

  @override
  State<IqamahSettings> createState() => _IqamahSettingsState();
}

class _IqamahSettingsState extends State<IqamahSettings> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 61,
            child: Text(widget.name),
          ),
          const SizedBox(
            width: 30,
          ),
          DropdownButton<String>(
            value: widget.dropdownValue,
            onChanged: (newValue) {
              setState(() {
                widget.dropdownValue = newValue!;
              });
            },
            items: widget.dropDownOptions
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.122,
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                initialValue: '10',
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Setting page screen__
class SettingPagesScreen extends StatefulWidget {
  final String appBarTitle;
  final Widget pageWidget;
  const SettingPagesScreen({
    super.key,
    required this.pageWidget,
    required this.appBarTitle,
  });

  @override
  State<SettingPagesScreen> createState() => _DrawerPagesScreenState();
}

class _DrawerPagesScreenState extends State<SettingPagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text(widget.appBarTitle),
      ),
      body: widget.pageWidget,
    );
  }
}

// Start drawer__
class StartDrawer extends StatefulWidget {
  const StartDrawer({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.mHeight,
    required this.mWidth,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double mHeight;
  final double mWidth;

  @override
  State<StartDrawer> createState() => _StartDrawerState();
}

class _StartDrawerState extends State<StartDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: sec,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: NetworkImage(start_drawer_header_userimage),
                ),
                Text(start_drawer_username, style: start_drawer_username_tstyle)
              ],
            ),
          )),
          const DrawerList(
            title: 'About us',
            icon: Icons.question_mark,
            pageWidget: AboutUsPage(),
          ),
          const DrawerList(
            title: 'Contact us',
            icon: Icons.phone,
            pageWidget: ContaceusDetailsScreen(),
          ),
          const DrawerList(
            title: 'Membership',
            pageWidget: Center(child: Text('Membership')),
            icon: Icons.card_membership,
          ),
          DrawerList(
            title: 'Volunteer Signup',
            icon: Icons.volunteer_activism,
            pageWidget: VolunteerSignUpPageScreen(
              formKey: widget._formKey,
              mHeight: widget.mHeight,
              mWidth: widget.mWidth,
              pageTitle: 'Sign Up for Volunteer',
              pageSubTitle:
                  "Fill out your information below and Join us in making a positive impact in your community!",
              buttonText: 'Sign up',
            ),
          ),
          const DrawerList(
            title: 'Setting',
            icon: Icons.settings,
            pageWidget: SettingPageScreen(),
          ),
          const DrawerList(
            title: 'Sign in',
            icon: Icons.person,
            pageWidget: SigninScreen(),
          ),
        ],
      ),
    );
  }
}

// Signed in start drawer__
class SignedInStartDrawer extends StatefulWidget {
  const SignedInStartDrawer({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.mHeight,
    required this.mWidth,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double mHeight;
  final double mWidth;

  @override
  State<SignedInStartDrawer> createState() => _SignedInStartDrawerState();
}

class _SignedInStartDrawerState extends State<SignedInStartDrawer> {
  String? userName;
  getName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString("name");
    });
  }

  @override
  void initState() {
    Userget().fetchUsers();
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: sec,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: NetworkImage(Userget.image ??
                      "https://az-pe.com/wp-content/uploads/2018/05/kemptons-blank-profile-picture.jpg"),
                ),
                Text(userName ?? "loading...",
                    style: start_drawer_username_tstyle)
              ],
            ),
          )),
          const DrawerList(
            title: 'About us',
            icon: Icons.question_mark,
            pageWidget: AboutUsPage(),
          ),
          const DrawerList(
            title: 'Contact us',
            icon: Icons.phone,
            pageWidget: ContaceusDetailsScreen(),
          ),
          const DrawerList(
            title: 'Membership',
            pageWidget: Center(child: Text('Membership')),
            icon: Icons.card_membership,
          ),
          DrawerList(
            title: 'Newsletter Signup',
            icon: Icons.newspaper,
            pageWidget: NewsletterScreen(
                formKey: widget._formKey,
                mHeight: widget.mHeight,
                mWidth: widget.mWidth),
          ),
          const DrawerList(
            title: 'Setting',
            icon: Icons.settings,
            pageWidget: SettingPageScreen(),
          ),
          InkWell(
              onTap: () async {
                Auth(context).signOut();
              },
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white12, width: 0.5),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    "Logout",
                    style: drawer_title_tstyle,
                  ),
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

//News Slide Widget0__
class NewsSlideWidget0 extends StatelessWidget {
  const NewsSlideWidget0({
    Key? key,
    required this.news,
  }) : super(key: key);

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return news.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Stack(
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
                    image: NetworkImage(news[0].images[0]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsInnerScreen(
                            title: news[0].title,
                            date: news[0].date,
                            image: news[0].images[0],
                            content: parse(news[0].content).body!.text,
                          ),
                        ));
                  },
                  child: ListTile(
                    title: Text(
                      news[0].title,
                      style: news_slide_widget_title_tstyle,
                    ),
                    subtitle: Text(news[0].date,
                        style: news_slide_widget_subtitle_tstyle),
                  ),
                ),
              ),
            ],
          );
  }
}

//News Slide Widget1__
class NewsSlideWidget1 extends StatelessWidget {
  const NewsSlideWidget1({
    Key? key,
    required this.news,
  }) : super(key: key);

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return news.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Stack(
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
                    image: NetworkImage(news[1].images[0]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsInnerScreen(
                            title: news[1].title,
                            date: news[1].date,
                            image: news[1].images[0],
                            content: parse(news[1].content).body!.text,
                          ),
                        ));
                  },
                  child: ListTile(
                    title: Text(
                      news[1].title,
                      style: news_slide_widget_title_tstyle,
                    ),
                    subtitle: Text(news[1].date,
                        style: news_slide_widget_subtitle_tstyle),
                  ),
                ),
              ),
            ],
          );
  }
}

//News List Tle Widget__
class NewsListtileWidget extends StatefulWidget {
  const NewsListtileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsListtileWidget> createState() => _NewsListtileWidgetState();
}

class _NewsListtileWidgetState extends State<NewsListtileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/news_inner_screen');
        },
        child: ListTile(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(news_list_tile_widget_title,
              style: news_list_tile_widget_title_tstyle),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(news_slide_widget_description,
                  maxLines: 2, style: news_slide_widget_description_tstyle),
              Text(
                news_slide_widget_date,
                style: news_slide_widget_date_tstyle,
              ),
            ],
          ),
          trailing: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 100,
              minHeight: 300,
              maxWidth: 104,
              maxHeight: 300,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(news_list_tile_widget_news_image)),
            ),
          ),
        ),
      ),
    );
  }
}

// ASk the imam - Categories widget__
class AskTheImamCategories extends StatefulWidget {
  var catId;
  final String catName;
  String? catDescription;
  final String imageUrl;
  final String noQuesntions;
  AskTheImamCategories({
    Key? key,
    required this.catName,
    required this.catId,
    this.catDescription,
    required this.imageUrl,
    required this.noQuesntions,
  }) : super(key: key);

  @override
  State<AskTheImamCategories> createState() => _AskTheImamCategoriesState();
}

class _AskTheImamCategoriesState extends State<AskTheImamCategories> {
  Dio dio = Dio();
  var userToken;
  List<Question> question = [];
  Future fetchCategoriess() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.headers["Accept"] = "application/json";
      dio.options.headers["Content-Type"] = "application/json";

      Response response = await dio
          .get("http://52.90.175.175/api/questions/get/${widget.catId}?page=1");
      var data = response.data["data"]["data"] as List;

      setState(() {
        question = data.map((d) => Question.fromJson(d)).toList();
        userToken = prefs.getString("token");
      });
    } catch (ex) {
      rethrow;
    }
  }

  @override
  void initState() {
    fetchCategoriess();
    print("User toke : ${userToken}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AskTheImamCategoriesScreen(
                appBarTitle: widget.catName,
                catDescription: widget.catDescription,
                pageWidget: ListView.builder(
                  itemCount: question.length,
                  itemBuilder: (BuildContext context, int i) {
                    return InkWell(
                      onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FAQInnerScreen(
                                date: question[i].date,
                                questions: question[i].question,
                                answer: question[i].answer,
                              ),
                            ),
                          )),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(8, 19, 19, 19),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 0,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                question[i].date.toString(),
                                style: ask_the_imam_question_date_tstyle,
                              ),
                              Text(
                                question[i].question,
                                maxLines: 2,
                                style: ask_the_imam_question_tstyle,
                              ),
                            ],
                          ),
                          trailing: SizedBox(
                            width: 80,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(height: double.maxFinite),
                                Text(
                                  'Read More',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: appBarColor,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10,
                                  color: sec,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(widget.catName,
                            style: ask_the_imam_question_cat_name_tstyle),
                        Text(
                          widget.noQuesntions,
                        ),
                      ],
                    ),
                  )),
            ],
          )
        ]),
      ),
    );
  }
}

class Question {
  String question;
  String answer;
  var date;
  Question({
    required this.question,
    required this.answer,
    required this.date,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json["question"] ?? "",
      answer: json["answer"] ?? "",
      date: json["created_at"] ?? "",
    );
  }
}
