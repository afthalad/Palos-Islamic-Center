// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unused_field

import 'dart:async';
import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/membership.dart';
import 'package:al_sahabah/screens/prayer_time.dart';
import 'package:al_sahabah/services/authenticaition.dart';
// import 'package:al_sahabah/services/news_get.dart';
// import 'package:al_sahabah/services/prayer_time_by_date.dart';
import 'package:al_sahabah/services/user_get.dart';
import 'package:al_sahabah/screens/ask_the_imam/categories_inner.dart';
import 'package:al_sahabah/screens/ask_the_imam/faq_inner.dart';
import 'package:al_sahabah/screens/ask_the_imam/main.dart';
import 'package:al_sahabah/screens/about_us.dart';
import 'package:al_sahabah/screens/contact_us.dart';
import 'package:al_sahabah/screens/news.dart';
import 'package:al_sahabah/screens/news_inner.dart';
import 'package:al_sahabah/screens/newsletter.dart';
import 'package:al_sahabah/screens/settings/setting.dart';
import 'package:al_sahabah/screens/sign_up.dart';
import 'package:al_sahabah/screens/sing_in.dart';
import 'package:al_sahabah/voulunteer_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 10),
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
  Timer? _timer;

  Future<void> fetchPrayerTime() async {
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString().padLeft(2, '0');
    String day = DateTime.now().day.toString().padLeft(2, '0');

    currentDate = "$year-$month-$day";
    //include current date  admin panel
    Response response =
        await dio.get("http://52.90.175.175/api/prayer-time/get/$currentDate");
    if (!mounted) {
      return;
    }
    if (response.data["data"] != null) {
      setState(() {
        prayerTime.add(PrayerTimeClass.fromJson(response.data["data"]));
      });
    }
  }

  String convertTo12HourFormat(String time24) {
    final time24Hour = DateFormat('HH:mm').parse(time24);
    return DateFormat('h:mm a').format(time24Hour);
  }

  @override
  void initState() {
    fetchPrayerTime();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.mHeight * 0.08,
      color: mSalah_time_container_color,
      child: prayerTime.isEmpty
          ? const Center(child: Text("Loading..."))
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SalahTime(
                      mWidth: widget.mWidth * 0.3,
                      salahTitle: 'Fajir',
                      salahTime: convertTo12HourFormat(prayerTime[0].fajir),
                    ),
                    SalahTime(
                      mWidth: widget.mWidth * 0.3,
                      salahTitle: 'Duhr',
                      salahTime: convertTo12HourFormat(prayerTime[0].dhuhar),
                    ),
                    SalahTime(
                      mWidth: widget.mWidth * 0.3,
                      salahTitle: 'Asr',
                      salahTime: convertTo12HourFormat(prayerTime[0].asr),
                    ),
                    SalahTime(
                      mWidth: widget.mWidth * 0.3,
                      salahTitle: 'Magrib',
                      salahTime: convertTo12HourFormat(prayerTime[0].magrib),
                    ),
                    SalahTime(
                      mWidth: widget.mWidth * 0.3,
                      salahTitle: 'Isha',
                      salahTime: convertTo12HourFormat(prayerTime[0].isha),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

class SalahTimeRemingWidget extends StatefulWidget {
  const SalahTimeRemingWidget({
    Key? key,
    required this.mHeight,
    required this.cPrayerName,
    required this.cPrayerTime,
  }) : super(key: key);

  final double mHeight;
  final cPrayerName;
  final cPrayerTime;

  @override
  State<SalahTimeRemingWidget> createState() => _SalahTimeRemingWidgetState();
}

class _SalahTimeRemingWidgetState extends State<SalahTimeRemingWidget> {
  Timer? _timer;
  var reminingTime;

  reminingTimeDiff() async {
    DateTime now = DateTime.now();
    var now2 = DateFormat.Hms().format(now);
    var time = await DateFormat("h:mm a").parse("${widget.cPrayerTime}");
    var time2 = DateFormat("HH:mm:ss").parse("$now2");
    var diff = time.difference(time2);

    // If difference is negative, add 24 hours
    if (diff.inSeconds < 0) {
      diff = diff + Duration(hours: 24);
    }

    setState(() {
      reminingTime = diff;
    });
  }

  @override
  void initState() {
    super.initState();
    reminingTimeDiff();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      if (!mounted) return;
      setState(() {});
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      height: widget.mHeight * 0.08,
      color: mSalah_time_container_color,
      child: widget.cPrayerTime == "00:00:00"
          ? const Center(child: Text("Loading..."))
          : reminingTime == null
              ? const Center(child: Text("Loading..."))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.cPrayerName} at  ${widget.cPrayerTime}',
                          style: mSalah_time_subtitle_tstyle,
                        ),
                        Text(
                          'Remining time : ${(reminingTime.inHours - _timer!.tick ~/ 3600).toString().padLeft(2, '0')}:${((reminingTime.inMinutes - _timer!.tick ~/ 60) % 60).toString().padLeft(2, '0')}:${(reminingTime.inSeconds - _timer!.tick) % 60}',
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
    );
  }
}

class FeaturesCardFromAdmin extends StatelessWidget {
  final String featuresIcon;
  final String featuresTitle;

  const FeaturesCardFromAdmin({
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        width: mWidth * 0.3,
        height: 75, // change the height to match the FeaturesCard height
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              child: Image(
                image: NetworkImage(featuresIcon),
              ),
            ),
            Text(
              featuresTitle,
              style: features_title_tstyle,
            )
          ],
        ),
      ),
    );
  }
}

//1st Main Features Card__
class MFeaturesCard1 extends StatelessWidget {
  MFeaturesCard1({
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
              child: SingleChildScrollView(
                child: FeaturesCard(
                  mWidth: mWidth,
                  mHeight: mHeight,
                  featuresIcon: 'images/icon-event.png',
                  featuresTitle: 'Events',
                ),
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
                Navigator.pushNamed(context, "/news_screen");
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon-news.png',
                featuresTitle: 'News',
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
                image: NetworkImage(widget.image),
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
          bottom: BorderSide(color: Colors.white38, width: 0.5),
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

// Jummah time widget
class JummahPrayerTimesWidget extends StatefulWidget {
  const JummahPrayerTimesWidget({
    Key? key,
    required this.mHeight,
    required this.jummahTime,
  }) : super(key: key);

  final double mHeight;
  final jummahTime;

  @override
  State<JummahPrayerTimesWidget> createState() =>
      _JummahPrayerTimesWidgetState();
}

class _JummahPrayerTimesWidgetState extends State<JummahPrayerTimesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.mHeight * 0.08,
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
                    Text(
                      "11:05 AM",
                      style: mSalah_time_subtitle_tstyle,
                    ),
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
                    Text(widget.jummahTime, style: mSalah_time_subtitle_tstyle),
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
                    Text("01.30 PM", style: mSalah_time_subtitle_tstyle),
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
      backgroundColor: appBarColor,
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
                  backgroundImage: AssetImage(start_drawer_header_userimage),
                ),
                // Text(start_drawer_username, style: start_drawer_username_tstyle)
                // Text(start_drawer_username, style: start_drawer_username_tstyle)
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
          DrawerList(
            title: 'Membership',
            pageWidget: MembershipScreen(
              buttonText: "Add",
              pageTitle: "Membership",
              pageSubTitle:
                  "Upgrade to unlock exclusive benefits and rewards with our membership program.",
              formKey: widget._formKey,
              mHeight: widget.mHeight,
              mWidth: widget.mWidth,
            ),
            icon: Icons.card_membership,
          ),
          DrawerList(
            title: 'Volunteer request',
            icon: Icons.volunteer_activism,
            pageWidget: VolunteerRequest(
              formKey: widget._formKey,
              mHeight: widget.mHeight,
              mWidth: widget.mWidth,
              pageTitle: 'Request for Volunteer',
              pageSubTitle:
                  "Fill out your information below and Join us in making a positive impact in your community!",
              buttonText: 'Submit',
            ),
          ),
          const DrawerList(
            title: 'Setting',
            icon: Icons.settings,
            pageWidget: SettingPageScreen(),
          ),
          const DrawerList(
            title: 'Sign in / Sign up',
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
          DrawerList(
            title: 'Membership',
            pageWidget: MembershipScreen(
              buttonText: "Add",
              pageTitle: "Membership",
              pageSubTitle:
                  "Upgrade to unlock exclusive benefits and rewards with our membership program.",
              formKey: widget._formKey,
              mHeight: widget.mHeight,
              mWidth: widget.mWidth,
            ),
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
          DrawerList(
            title: 'Volunteer request',
            icon: Icons.volunteer_activism,
            pageWidget: VolunteerRequest(
              formKey: widget._formKey,
              mHeight: widget.mHeight,
              mWidth: widget.mWidth,
              pageTitle: 'Request for Volunteer',
              pageSubTitle:
                  "Fill out your information below and Join us in making a positive impact in your community!",
              buttonText: 'Submit',
            ),
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
                height: MediaQuery.of(context).size.height * 0.4,
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
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white54,
                    size: 20,
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

      Response response = await dio
          .get("http://52.90.175.175/api/questions/get/${widget.catId}?page=1");

      var data = response.data["data"]["data"] as List;
      if (!mounted) return;
      setState(() {
        question.addAll(data.map((i) => Question.fromJson(i)).toList());
      });
    } catch (ex) {
      rethrow;
    }
  }

  @override
  void initState() {
    fetchCategoriess();
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

class ContactUsSocial extends StatelessWidget {
  const ContactUsSocial({
    Key? key,
    required this.title,
    this.link,
    required this.image,
  }) : super(key: key);
  final String title;
  final String image;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            launchUrl(Uri.parse(link!));
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  child: Image(
                    image: AssetImage(image),
                  ),
                ),
                Text(
                  title,
                  style: features_title_tstyle,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
