// ignore_for_file: non_constant_identifier_names

import 'package:al_sahabah/const/const.dart';
// import 'package:al_sahabah/models/prayer_time_by_date.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:intl/intl.dart';

class PrayerTimeClass {
  String date;
  String week;
  var fajir;
  var sunrise;
  var dhuhar;
  var asr;
  var magrib;
  var isha;
  var fajir_iqamath;
  var dhuhar_iqamath;
  var asr_iqamath;
  var magrib_iqamath;
  var isha_iqamath;

  PrayerTimeClass({
    required this.date,
    required this.week,
    required this.fajir,
    required this.sunrise,
    required this.dhuhar,
    required this.asr,
    required this.magrib,
    required this.isha,
    required this.fajir_iqamath,
    required this.dhuhar_iqamath,
    required this.asr_iqamath,
    required this.magrib_iqamath,
    required this.isha_iqamath,
  });

  factory PrayerTimeClass.fromJson(Map<String, dynamic> json) {
    return PrayerTimeClass(
        date: json['date'],
        week: json['week'],
        fajir: json['fajir'],
        sunrise: json['sunrise'],
        dhuhar: json['dhuhar'],
        asr: json['asr'],
        magrib: json['magrib'],
        isha: json['isha'],
        fajir_iqamath: json['fajir_iqamath'],
        dhuhar_iqamath: json['dhuhar_iqamath'],
        asr_iqamath: json['asr_iqamath'],
        magrib_iqamath: json['magrib_iqamath'],
        isha_iqamath: json['isha_iqamath']);
  }
}

class PrayerTimingsScreen extends StatefulWidget {
  const PrayerTimingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PrayerTimingsScreen> createState() => _PrayerTimingsScreenState();
}

class _PrayerTimingsScreenState extends State<PrayerTimingsScreen> {
  Dio dio = Dio();
  static List<PrayerTimeClass> prayerTime = [];
  String currentDate = "";

  var time = DateTime.now();

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
        await dio.get("http://52.90.175.175/api/prayer-time/get/2023-02-01");

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
            prayerTime.isEmpty
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$currentDate\nToday",
                              style: prayer_time_table_islamic_month_tstyle,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Asr',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  'Remaining Time',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  "23-12",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Sunrise\n${prayerTime[0].sunrise}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
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
                        PrayerimeRow(
                            prayerTime: prayerTime[0].fajir,
                            prayerName: "Fajr ",
                            iqamathTime: prayerTime[0].fajir_iqamath),
                        PrayerimeRow(
                            prayerTime: prayerTime[0].sunrise,
                            prayerName: "Sunrise",
                            iqamathTime: "                   "),
                        PrayerimeRow(
                            prayerTime: prayerTime[0].dhuhar,
                            prayerName: "Dhuhar",
                            iqamathTime: prayerTime[0].dhuhar_iqamath),
                        PrayerimeRow(
                            prayerTime: prayerTime[0].asr,
                            prayerName: "Asr   ",
                            iqamathTime: prayerTime[0].asr_iqamath),
                        PrayerimeRow(
                            prayerTime: prayerTime[0].magrib,
                            prayerName: "Magrib",
                            iqamathTime: prayerTime[0].magrib_iqamath),
                        PrayerimeRow(
                            prayerTime: prayerTime[0].isha,
                            prayerName: "Isha  ",
                            iqamathTime: prayerTime[0].isha_iqamath),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class PrayerimeRow extends StatelessWidget {
  const PrayerimeRow({
    Key? key,
    required this.prayerTime,
    required this.prayerName,
    required this.iqamathTime,
  }) : super(key: key);

  final String prayerTime;
  final String prayerName;
  final String iqamathTime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListTile(
      shape: const Border(
        bottom: BorderSide(color: Colors.black12),
      ),
      leading: const Icon(
        Icons.sunny_snowing,
        color: Colors.white,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            prayerName,
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          Text(
            prayerTime,
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          Text(
            iqamathTime,
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    ));
  }
}
