// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';

// class PrayerTimeByDate {
//   Dio dio = Dio();
//   static List<PrayerTimeClass> prayerTime = [];
//   static String currentDate = "";

//   Future<void> fetchPrayerTime() async {
//     String year = DateTime.now().year.toString();
//     String month = DateTime.now().month.toString().padLeft(2, '0');
//     String day = DateTime.now().day.toString().padLeft(2, '0');

//     currentDate = "$year-$month-$day";

//     Response response =
//         await dio.get("http://52.90.175.175/api/prayer-time/get/$currentDate");

//     if (response.data["data"] != null) {
//       prayerTime.add(PrayerTimeClass.fromJson(response.data["data"]));
//     }
//   }
// }

class PrayerTimeClass {
  String date;
  String week;
  String fajir;
  String sunrise;
  String dhuhar;
  String asr;
  String magrib;
  String isha;
  String fajir_iqamath;
  String dhuhar_iqamath;
  String asr_iqamath;
  String magrib_iqamath;
  String isha_iqamath;

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
