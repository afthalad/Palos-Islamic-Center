import 'package:flutter/material.dart';

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
            ),
            FeaturesCard(
              mWidth: mWidth,
              mHeight: mHeight,
              featuresIcon: 'images/icon-event.png',
              featuresTitle: 'Events',
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
