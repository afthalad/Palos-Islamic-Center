import 'package:al_sahabah/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

//Prayer Timings screen
class PrayerTimingsScreen extends StatelessWidget {
  const PrayerTimingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
          fit: BoxFit.cover,
          image: const NetworkImage(
              'https://static.vecteezy.com/system/resources/previews/006/998/428/original/islamic-design-for-background-ramadan-kareem-banner-mosque-silhouette-design-illustration-ramadan-kareem-s-design-is-similar-to-greetings-invitations-templates-or-backgrounds-free-vector.jpg'),
        ),
      ),
      child: const ImageSlideshow(
        height: double.infinity,
        children: [
          PrayeTimeTable(),
          PrayeTimeTable(),
        ],
      ),
    );
  }
}
