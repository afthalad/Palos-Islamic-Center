// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/categories_inner.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/faq_inner.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/main.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/question_inner.dart';
import 'package:al_sahabah/screens/about_us.dart';
import 'package:al_sahabah/screens/contact_us.dart';
import 'package:al_sahabah/screens/events.dart';
import 'package:al_sahabah/screens/newsletter.dart';
import 'package:al_sahabah/screens/setting.dart';
import 'package:al_sahabah/screens/volunteer_sign_up.dart';
import 'package:al_sahabah/screens/sing_in.dart';
import 'package:flutter/material.dart';
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
class MSalahTime extends StatelessWidget {
  const MSalahTime({
    Key? key,
    required this.mHeight,
    required this.mWidth,
  }) : super(key: key);

  final double mHeight;
  final double mWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: mHeight * 0.2,
      color: mSalah_time_container_color,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SalahTime(
                mWidth: mWidth * 0.3,
                salahTitle: 'Subah',
                salahTime: '05.22 am',
              ),
              SalahTime(
                mWidth: mWidth * 0.3,
                salahTitle: 'Duhr',
                salahTime: '6.02 an',
              ),
              SalahTime(
                mWidth: mWidth * 0.3,
                salahTitle: 'Asr',
                salahTime: '12.42 pm',
              ),
              SalahTime(
                mWidth: mWidth * 0.3,
                salahTitle: 'Magrib',
                salahTime: '05.22 am',
              ),
              SalahTime(
                mWidth: mWidth * 0.3,
                salahTitle: 'Isha',
                salahTime: '6.02 an',
              ),
            ],
          ),
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
class Events extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/events_screen');
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Stack(children: [
          Container(
            height: mHeight * 0.3,
            width: mWidth * 1,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                fit: BoxFit.cover,
                image: AssetImage(image),
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
                  eventDateTime,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Text(
                  eventName,
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

  const FormTextField({
    Key? key,
    required this.hintText,
    required this.validatorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
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
class PrayeTimeTable extends StatelessWidget {
  const PrayeTimeTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                prayer_Time_table_islamic_month,
                style: prayer_time_table_islamic_month_tstyle,
              ),
              Column(
                children: const [
                  Text(
                    'Asr',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    'Remaining Time',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    '2:14:23',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Text(
                'Sunrise\n7.19 AM',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(''),
              const Text(''),
              Text(
                'ATHAN',
                style: prayer_time_table_heading_tstyle,
              ),
              Text(
                'IQAMAH',
                style: prayer_time_table_heading_tstyle,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  shape: Border(
                    bottom: BorderSide(color: Colors.black12),
                  ),
                  leading: Icon(
                    Icons.sunny_snowing,
                    color: Colors.white,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Fajr',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      Text(
                        '5.56am',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      Text(
                        '6.26am',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                );
              },
            ),
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
            leading: const Icon(
              Icons.notifications_active_sharp,
              color: Color(0xFF0D50A3),
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
          color: const Color(0xFF0D50A3),
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
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: Text(widget.appBarTitle),
      ),
      body: widget.pageWidget,
    );
  }
}

// Start drawer__
class StartDrawer extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0D50A3),
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
            title: 'Newsletter Signup',
            icon: Icons.newspaper,
            pageWidget: NewsletterScreen(
                formKey: _formKey, mHeight: mHeight, mWidth: mWidth),
          ),
          DrawerList(
            title: 'Volunteer Signup',
            icon: Icons.volunteer_activism,
            pageWidget: VolunteerSignUpPageScreen(
              formKey: _formKey,
              mHeight: mHeight,
              mWidth: mWidth,
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
          const DrawerList(
            title: 'Logout',
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}

//News Slide Widget__
class NewsSlideWidget extends StatelessWidget {
  const NewsSlideWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              image: NetworkImage(news_slide_widget_news_image),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/news_inner_screen');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(
                news_slide_widget_title,
                style: news_slide_widget_title_tstyle,
              ),
              subtitle: Text(news_slide_widget_subtitle,
                  style: news_slide_widget_subtitle_tstyle),
            ),
          ),
        ),
      ],
    );
  }
}

//News List Tle Widget__
class NewsListtileWidget extends StatelessWidget {
  const NewsListtileWidget({
    Key? key,
  }) : super(key: key);

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
class AskTheImamCategories extends StatelessWidget {
  final String catName;
  String? catDescription;
  final String imageUrl;
  final String noQuesntions;
  AskTheImamCategories({
    Key? key,
    required this.catName,
    this.catDescription,
    required this.imageUrl,
    required this.noQuesntions,
  }) : super(key: key);

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
                appBarTitle: catName,
                catDescription: catDescription,
                pageWidget: noQuesntions == "0"
                    ? Center(
                        child: Text(ask_the_imam_no_question_alert),
                      )
                    : ListView.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return const Questions(
                            appBarTitle: 'My Questions',
                            pageWidget: FAQInnerScreen(),
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
                image: NetworkImage(imageUrl),
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
                        Text(catName,
                            style: ask_the_imam_question_cat_name_tstyle),
                        Text(
                          noQuesntions,
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

// Ask the imam - Questions widget__
class Questions extends StatelessWidget {
  final String appBarTitle;
  final Widget pageWidget;
  const Questions({
    Key? key,
    required this.appBarTitle,
    required this.pageWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuestionsInnerScreen(
                appBarTittle: appBarTitle,
                pageWidget: pageWidget,
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
                ask_the_imam_question_date,
                style: ask_the_imam_question_date_tstyle,
              ),
              Text(
                ask_the_imam_question,
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
                    color: const Color(0xFF0D50A3),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: const Color(0xFF0D50A3),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
