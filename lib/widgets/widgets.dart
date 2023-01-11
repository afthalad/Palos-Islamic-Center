// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:al_sahabah/screens/featuresscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../screens/drawerpagescreen.dart';

//Salah Times
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
          Text(
            salahTitle,
            style: const TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            salahTime,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

//Main Salah Time Widget
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
      color: Color(0xFF66B35A),
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

//Features Card
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
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//1st Main Features Card
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
    final String vUrl = 'UzhGPikEdHA';

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: vUrl,
      flags: const YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: true,
        enableCaption: true,
      ),
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeautreScreen(
                      appBarTitle: 'Masjidh Service',
                      pageWidget: Padding(
                        padding: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'SERVICES OVERVIEW',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Service is among the highest callings of a human being.As such, the core mission of the Mosque Foundation is toprovide valuable services to its large community. Theseservices are meant to foster a strong sense of familyand community, and provide spiritual solace and sacredspace in a fast-paced and sometimes overwhelmingworld. More than 10,000 people benefit from the MosqueFoundation's services on a regular basis. We feel honoredto be of service to our oommunity. For more informationon each service, please click the service on the leftnavigation menu\n",
                              ),
                              Text(
                                '1. PRAYER SERVICES5 TIMES A DAY',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "One of the core services the Mosque Foundation offersis Prayer Services. The Mosque Foundation is a full timeMosque that conducts 5 daily prayer services 7 days aweek all year long. Additionally, the Mosque Foundationholds 2 Friday prayers due to space and parking lotslimitations. The timing for each prayer is posted on theright side of the home page (main page).\n\nFive separate times a day (dawn, noon, late afternoon,dusk, and evening), our Mosque is available forworshippers to come and perfom the sacred andbeautiful act of worship in congregation.\n",
                              ),
                              Text(
                                '2. MARRIAGE SERVICES',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "We offer pre-marriage advice to couples about tojoin each other in the holy bond and commitment ofmatrimony. We perform the formal marriage service, inconjunction with State requirements and documentation.\n",
                              ),
                              Text(
                                '4. ASK THE IMAM',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Often times we are confronted with a situation in whichthe right choice is not clear or we simply are not awareof the best ethical decision to make. The MosqueFoundation offers people opportunities to ask our Imamsabout these situations and how Islami's sacred law adresses them.\n",
                              ),
                              Text(
                                '5. ARBITRATION',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Whenever disagreements arise (whether they involve business matters or other aspects of life), it is useful to seek an impartial arbiter to help solve the problem. The Mosque Foundation offers objedisputes and preserve relations between the disputantstive arbitration .\n",
                              ),
                              Text(
                                '6. FUNERAL SERVICESS',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "When the inevitability of death comes to our loved ones,the details and pressures of funerals can be taxing. TheMosque Foundation offers grieving families funeralservices, including washing of the body. proper wrappingwith cloth, funeral sermons, and prayer services.\n",
                              ),
                              Text(
                                '7. FOOD PANTRY',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Thousands of needy families each year receive food fromour Food Pantry. Among the most praised kinds of charityis the feeding of the poor. Whenever we relieve the stressof the needy, our wealth never decreases and our rank inthe eyes of God increases.\n",
                              ),
                              Text(
                                '8. WEEKEND SCHOOL',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "The Mosque Foundation for the last 25 years hasprovided weekend education for our youth to learntimeless wisdom and gain valuable knowledge that willhelp achieve a firm understanding of their faith and theethics and morals it provides them. Over the years, tensof thousands of young boys and girls have learned at theMosque Foundation al-Siddiq weekend school. (Call forthe Mosque Foundation for details.)\n",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeautreScreen(
                      appBarTitle: 'Events',
                      pageWidget: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  opacity: 0.1,
                                  image: AssetImage('images/icon-calendar.png'),
                                ),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: const [
                                  Text(
                                    '20th',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'NOV',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            title: Text('Sister Class'),
                            subtitle: Text('Wed 06.00pm - 07.50pm'),
                            trailing: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: AssetImage('images/duhr.png'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
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
                launchUrl(Uri.parse('https://donorbox.org/pic22'));
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeautreScreen(
                        appBarTitle: 'Prayer Timing',
                        pageWidget: PrayerTimingsPagesWidget()),
                  ),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeautreScreen(
                        appBarTitle: 'Qibla', pageWidget: PrayeTimeTable()),
                  ),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeautreScreen(
                        appBarTitle: 'Live Streaming',
                        pageWidget: Column(
                          children: [
                            YoutubePlayer(
                              controller: _controller,
                              liveUIColor: Colors.red,
                            ),
                            Text(_controller.metadata.title)
                          ],
                        )),
                  ),
                );
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

//2nd Main Features Card
class MFeaturesCard2 extends StatelessWidget {
  const MFeaturesCard2({
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
                launchUrl(
                    Uri.parse('https://www.facebook.com/PalosIslamicCenter/'));
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
                launchUrl(
                    Uri.parse('https://youtube.com/@picpalosislmiccenter8485'));
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
                launchUrl(
                    Uri.parse('https://www.instagram.com/PalosIslamicCenter/'));
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
                launchUrl(Uri.parse(
                    'https://palosic.org/our-services/zakah-calculator/'));
              },
              child: FeaturesCard(
                mWidth: mWidth,
                mHeight: mHeight,
                featuresIcon: 'images/icon-calculator.png',
                featuresTitle: 'Zakat Calculator',
              ),
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icon-quote.png',
              featuresTitle: 'Sunnah',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icon-quote.png',
              featuresTitle: 'Quotes',
            ),
          ],
        ),
      ],
    );
  }
}

//Event card
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(children: [
        Container(
          height: mHeight * 0.2,
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
    );
  }
}

//Drawer pages
class DrawerList extends StatelessWidget {
  final String title;
  final Widget? pageWidget;
  final IconData icon;
  const DrawerList({
    Key? key,
    required this.title,
    required this.icon,
    required this.pageWidget,
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
          MaterialPageRoute(
            builder: (context) => DrawerPagesScreen(
              appBarTitle: title,
              pageWidget: pageWidget!,
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

//About us page widget
class AboutUsPageWidget extends StatelessWidget {
  const AboutUsPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'VISION STATEMENT',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Our vision is to be the leading mosque in the UnitedStates in providing Islamic guidance and services to thecommunity.\n',
            ),
            Text(
              'MISSION STATEMENT',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'The Mosque Foundation serves the spiritual, religiousand communal needs of area Muslims by meansof nurturing their faith, upholding their values, andfostering the well-being of the surrounding communitythrough worship, charity, education, outreach, and civicengagement.\n',
            ),
            Text(
              'HISTORY & TIMELINE',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "In 1954, a handful of Palestinian immigrants on Chicago'sfamous Southside established the Mosque Foundationof Chicago with the dream of one day building a structureto house the religious and cultural activities of theirgrowing young families. Today, that dream is reality asthe Mosque Foundation has become one of the busiestmosques in America, serving a community of more than50,000 Muslims.\n\nBuilt in 1981 on a few acres of swampy land in themiddle of mostly abandoned prairie in Bridgeview, theMosque Foundation began as a small structure with amaximum prayer hall capacity of 300 worshippers. Noone could foresee that the mosque's establishmentWould inspire a Muslim neighborhood of hundreds ofbeautiful new homes around the mosque, two full-timeIslamic schools at its perimeters, a Community Centerdown the road, and dozens of thriving businesses.\n\nThe community has steadily diversified to includeMuslims of many languages and experiences-all prayingside-by-side. Imams are active in education, counseling,spiritual guidance, and arbitration. Community memberswork with local and nation al Islamic, interfaith, and civicorganizations on numerous initiatives such as protectingAmerican civil liberties. empowerina Muslims.\n\nVery early on, Chicago area Muslims rented varioussites around the south side of Chicago to holdcongregational Eid Prayers and celebrations. Fridayprayers were sometimes held in storefront propertiesof Muslim-owned businesses. As the population ofthe Muslim community grew, the need was realized topurchase property. So, in 1963, a church located at 6500S. Steward Avenue was purchased and converted into aprayer hall and school for the community of more thana hundred Arab Muslim families living in the southwestside of Chicago at the time. Arabic language and religionclasses were held in the Steward property, as well asvarious community functions. Several years later, thebuilding was sold to purchase a storefront property at79th and Clyde Avenue.\n\nThe Clyde property was sold shortly thereafter, with theproceeds reserved to purchase land in Bridgeview, wherethe Mosque currently stands. Designs of the Mosquewere presented in 1977, and construction began inNovember 1978. Three years later, in 1981, the doorsto the Mosque Foundation were officially opened, andthe first congregational prayers were held. All five dailyobligatory prayers and Friday congregational prayerswere offered from the start, as well as nightly Taraweehprayers during the month of Ramadan. Quran recitationclasses, Hadith lectures, and regular monthly meetingswere established to serve the spiritual and social needsof the community.\n\nIt is impossible to overestimate the impact the MosqueFoundation has had on the community, particularly theyouth. While a youth group was formed very early on tocater to the needs of the younger generation, a separatebuilding designated for the youth was purchasedand opened in 1996. We have witnessed young menwho seemed destined to a life of crime and violencebecome outstandina citizens who are now students andwho seemed destined to a life of crime and violencebecome outstanding citizens who are now students andprofessionals in a variety of fields, due largely in part tothose dedicated youth mentors.\n\nDuring the 1990's, the Mosque Foundation communityexpanded greater than anyone could have predicted.The growing needs and increasing numbers required theMosque Foundation to expand its original facility, whichwas completed in 1998. Yet, even as the new prayer areanearly doubled in size, two Friday Congregational Prayersand two evening Ramadan Taraweeh Prayers were stillneeded to serve the large community. Among the manyfunctions of a mosque is to serve the needy, and itsvarious roles in serving the community continues to grow.For example, in 2005 the Mosque Foundation openedaCommunity Food Pantry to help combat hunger for lowincome families in the local community.\n\nThis is an unavoidably brief history of the MosqueFoundation, but it's important to know the services thisinstitution provides in a general sense that cannot bedated through:\n\n⚫ Providing an environment in which men and womenmay worship with peace of mind and a sense of home.\n\n⚫ Thousands of young people learning the morals andethics of their religion in the weekend schools.\n\n⚫ Hundreds of families receiving counseling for avariety of personal concerns, marriage matters, disputeresolutions, and bereavement and funeral senvices.\n\n⚫ Providing many social services for the underprivileged,free health screenings, and support for needy families.\n\n⚫ Reaching out and establishing strong relations withleaders and congregations of other faith communities-Catholic, Protestant, and Jewish. The MosqueFoundation is commito the noble enterprise cmutual understanding"),
          ],
        ),
      ),
    );
  }
}

//Contace Us Details
class ContaceusDetailsPageWidget extends StatelessWidget {
  const ContaceusDetailsPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12, width: 0.5),
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.aclu.org/wp-content/uploads/2019/09/devon_chaffee_webedit-scaled.jpg'),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Oussuma Jammal',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text('President and Chairman of the board',
                      style: TextStyle(fontSize: 12)),
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ojammal@mosquefoundation.org',
                      style: TextStyle(fontSize: 12)),
                  Text('(708)430-567', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

//Signup page widgets
class SignUpPageWidget extends StatelessWidget {
  final String pageTitle;
  final String pageSubTitle;
  final String buttonText;
  const SignUpPageWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.mHeight,
    required this.mWidth,
    required this.pageTitle,
    required this.pageSubTitle,
    required this.buttonText,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double mHeight;
  final double mWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        reverse: true,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  pageTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                subtitle: Text(pageSubTitle),
              ),
              const FormTextField(
                hintText: 'Name',
                validatorText: 'Please enter your name',
              ),
              const FormTextField(
                hintText: 'Email',
                validatorText: 'Please enter your email',
              ),
              const FormTextField(
                hintText: 'Phone number',
                validatorText: 'Please enter your phone number',
              ),
              const FormTextField(
                hintText: 'Age',
                validatorText: 'Please enter your age',
              ),
              const FormTextField(
                hintText: 'Interested in',
                validatorText: 'Please enter somthing ',
              ),
              SizedBox(height: mHeight * 0.01),
              Container(
                width: mWidth * 0.95,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    elevation: 0,
                    backgroundColor: const Color(0xFF0D50A3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(-10)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, submit it or do something else
                    }
                  },
                  child: Text(
                    buttonText,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Form Fields
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
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(15),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

//Prayer Timings
class PrayerTimingsPagesWidget extends StatelessWidget {
  const PrayerTimingsPagesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.darken),
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://static.vecteezy.com/system/resources/previews/006/998/428/original/islamic-design-for-background-ramadan-kareem-banner-mosque-silhouette-design-illustration-ramadan-kareem-s-design-is-similar-to-greetings-invitations-templates-or-backgrounds-free-vector.jpg'),
        ),
      ),
      child: ImageSlideshow(
        height: double.infinity,
        children: [PrayeTimeTable(), PrayeTimeTable()],
      ),
    );
  }
}

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
          // const Text(
          //   'Today',
          //   style: TextStyle(
          //       color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tue, 19 \nJumma',
                style: TextStyle(color: Colors.white, fontSize: 13),
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
                    style: TextStyle(color: Colors.white, fontSize: 15),
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
              Text(''),
              Text(''),
              Text(
                'ATHAN',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              Text(
                'IQAMAH',
                style: TextStyle(color: Colors.white, fontSize: 13),
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

//News letter Page Widget
class NewsletterPageWidget extends StatelessWidget {
  const NewsletterPageWidget({
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
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 200,
            child: Image(image: AssetImage('images/email.png')),
          ),
          Text(
            'Subscribe Newsletter',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('Subscribe to our updates right in your inbox.'),
          FormTextField(
            hintText: 'Email',
            validatorText: 'Please enter email to subscribe',
          ),
          SizedBox(height: mHeight * 0.01),
          Container(
            width: mWidth * 0.95,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                elevation: 0,
                backgroundColor: const Color(0xFF0D50A3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(-10)),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, submit it or do something else
                }
              },
              child: Text(
                'Subscribe',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Notification News Widget
class NotificatonNewsCard extends StatelessWidget {
  const NotificatonNewsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
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
              color: const Color(0xFF0D50A3),
            ),
            title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets. ',
                    style: TextStyle(fontSize: 10),
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
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.darken),
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://img.freepik.com/free-vector/ramadan-landscape-background-sunset_1048-1789.jpg?w=2000'),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notification & News',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Text(
                      'Stay up to date with the latest notifications and news.',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
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
