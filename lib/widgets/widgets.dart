import 'package:al_sahabah/screens/featuresscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final Widget? featuresPageWidget;
  const FeaturesCard({
    Key? key,
    required this.featuresIcon,
    required this.featuresTitle,
    this.featuresPageWidget,
    required this.mWidth,
    required this.mHeight,
  }) : super(key: key);

  final double mWidth;
  final double mHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FeautreScreen(
              appBarTitle: featuresTitle,
              pageWidget: featuresPageWidget!,
            ),
          ),
        );
      },
      child: Padding(
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icon.png',
              featuresTitle: 'Masjidh Service',
              featuresPageWidget: Padding(
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
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icon-event.png',
              featuresTitle: 'Events',
              featuresPageWidget: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text('data'),
                    title: Text('Sister Class'),
                    subtitle: Text('Wed 06.00pm - 07.50pm'),
                  );
                },
              ),
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icon-donation.png',
              featuresTitle: 'Donation',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icon-time.png',
              featuresTitle: 'Prayer Timings',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icons-location.png',
              featuresTitle: 'Location',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icons-youtube.png',
              featuresTitle: 'Live Streaming',
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
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icon-imam.png',
              featuresTitle: 'Ask the imam',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icon-quote.png',
              featuresTitle: 'Jumada al-akhir',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icon-discount.png',
              featuresTitle: 'Promotions',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icon-quote.png',
              featuresTitle: 'Dua o Azkar',
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
