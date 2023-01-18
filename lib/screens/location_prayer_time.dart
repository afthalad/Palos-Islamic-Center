import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

//Location Prayer Timings screen
class LocationPrayerTimingsScreen extends StatelessWidget {
  const LocationPrayerTimingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.darken),
            fit: BoxFit.cover,
            image: NetworkImage(prayer_timing_screen_bgimage),
          ),
        ),
        child: const ImageSlideshow(
          height: double.infinity,
          children: [
            PrayeTimeTable(),
            PrayeTimeTable(),
          ],
        ),
      ),
    );
  }
}
