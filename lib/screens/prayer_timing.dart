import 'package:al_sahabah/const/const.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: const Text('Prayer Time'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.darken),
            fit: BoxFit.cover,
            image: NetworkImage(prayer_timing_screen_bgimage),
          ),
        ),
        child: ImageSlideshow(
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
