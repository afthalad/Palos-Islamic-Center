import 'package:flutter/material.dart';

//Salah Times
class SalahTime extends StatelessWidget {
  final double mWidth;

  final String salahImage;
  final String salahTitle;
  final String salahTime;

  const SalahTime({
    Key? key,
    required this.mWidth,
    required this.salahImage,
    required this.salahTitle,
    required this.salahTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: mWidth,
      height: 70,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
          fit: BoxFit.cover,
          image: AssetImage(
            salahImage,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              salahTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            Text(
              salahTime,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SalahTime(
                  mWidth: mWidth * 0.3,
                  salahImage: 'images/subah.png',
                  salahTitle: 'Fajr',
                  salahTime: '05.22 am',
                ),
                SalahTime(
                  mWidth: mWidth * 0.3,
                  salahImage: 'images/sunrise.png',
                  salahTitle: 'Sunrise',
                  salahTime: '6.02 an',
                ),
                SalahTime(
                  mWidth: mWidth * 0.3,
                  salahImage: 'images/duhr.png',
                  salahTitle: 'Duhr',
                  salahTime: '12.42 pm',
                ),
                SalahTime(
                  mWidth: mWidth * 0.3,
                  salahImage: 'images/sunrise.png',
                  salahTitle: 'Asr',
                  salahTime: '03.22 pm',
                ),
                SalahTime(
                  mWidth: mWidth * 0.3,
                  salahImage: 'images/magrib.png',
                  salahTitle: 'Magrib',
                  salahTime: '6.02 pm',
                ),
                SalahTime(
                  mWidth: mWidth * 0.3,
                  salahImage: 'images/isha.png',
                  salahTitle: 'Isha',
                  salahTime: '03.42 am',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Features Card
class FeaturesCard extends StatelessWidget {
  final IconData featuresIcon;
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
              Icon(
                featuresIcon,
                color: Colors.black54,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                featuresTitle,
                style: TextStyle(
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: Icons.mosque_outlined,
              featuresTitle: 'Masjidh Service',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: Icons.event,
              featuresTitle: 'Events',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: Icons.money_sharp,
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
              featuresIcon: Icons.timer_outlined,
              featuresTitle: 'Prayer Timings',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: Icons.location_on_outlined,
              featuresTitle: 'Location',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: Icons.live_tv_sharp,
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
              featuresIcon: Icons.mosque_outlined,
              featuresTitle: 'Ask the imam',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: Icons.event,
              featuresTitle: 'Jumada al-akhir',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: Icons.mosque_outlined,
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
              featuresIcon: Icons.mosque_outlined,
              featuresTitle: 'Dua o Azkar',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: Icons.mosque_outlined,
              featuresTitle: 'Sunnah',
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: Icons.format_quote_outlined,
              featuresTitle: 'Quotes',
            ),
          ],
        ),
      ],
    );
  }
}

//Event card
