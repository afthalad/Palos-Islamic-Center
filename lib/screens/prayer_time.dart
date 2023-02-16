// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations

import 'dart:async';

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
  static List<PrayerTimeClass> prayerTimeNexDay = [];
  static List<PrayerTimeClass> monthPrayerTime = [];
  var time = DateTime.now();
  var cPrayerTime = "";
  var remingTime;
  String currentDate = "";
  String nextDayDate = "";
  String cPrayerName = "";
  Timer? _timer;

  prayerTimeGet() async {
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString().padLeft(2, '0');
    String day = DateTime.now().day.toString().padLeft(2, '0');
    String nextDay =
        DateTime.now().add(Duration(days: 1)).day.toString().padLeft(2, '0');

    setState(() {
      currentDate = "$year-$month-$day";
      nextDayDate = "$year-$month-$nextDay";
    });

    Response nextDayResponse =
        await dio.get("http://52.90.175.175/api/prayer-time/get/$nextDayDate");
    if (!mounted) return;
    setState(() {
      prayerTimeNexDay
          .add(PrayerTimeClass.fromJson(nextDayResponse.data["data"]));
    });

    // include current data in admin panel $currentDate
    Response todayResponse =
        await dio.get("http://52.90.175.175/api/prayer-time/get/$currentDate");

    if (todayResponse.data["data"] != null) {
      setState(() {
        prayerTime.add(PrayerTimeClass.fromJson(todayResponse.data["data"]));
      });

      DateTime fajirTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].fajir}");
      DateTime dhuhrTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].dhuhar}");
      DateTime asrTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].asr}");
      DateTime magribTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].magrib}");
      DateTime ishaTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].isha}");
      DateTime nextDayFajirTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
          "${DateTime.now().toString().substring(0, 10)} ${prayerTimeNexDay[0].fajir}");
      DateTime now = DateTime.now();

      if (now.isBefore(fajirTime)) {
        cPrayerName = await "Fajr";
        cPrayerTime = await DateFormat.Hms().format(fajirTime);
        remingTime = await fajirTime.difference(now);
      } else if (now.isAfter(fajirTime) && now.isBefore(dhuhrTime)) {
        cPrayerName = await "Duhur";
        cPrayerTime = await DateFormat.Hms().format(dhuhrTime);
        remingTime = await dhuhrTime.difference(now);
      } else if (now.isAfter(dhuhrTime) && now.isBefore(asrTime)) {
        cPrayerName = await "Asr";
        cPrayerTime = await DateFormat.Hms().format(asrTime);
        remingTime = await asrTime.difference(now);
      } else if (now.isAfter(asrTime) && now.isBefore(magribTime)) {
        cPrayerName = await "Magrib";
        cPrayerTime = await DateFormat.Hms().format(magribTime);
        remingTime = await magribTime.difference(now);
      } else if (now.isAfter(magribTime) && now.isBefore(ishaTime)) {
        cPrayerName = await "Isha";
        cPrayerTime = await DateFormat.Hms().format(ishaTime);
        remingTime = await ishaTime.difference(now);
      } else {
        cPrayerName = await "Fajr";
        cPrayerTime = await DateFormat.Hms()
            .format(nextDayFajirTime.add(Duration(hours: 24)));
        remingTime =
            await (nextDayFajirTime.add(Duration(hours: 24))).difference(now);
      }
    } else {}
  }

  String convertTo12HourFormat(String time24) {
    final time24Hour = DateFormat('HH:mm').parse(time24);
    return DateFormat('h:mm a').format(time24Hour);
  }

  Future<void> _fetchPrayerTimes() async {
    DateTime now = await DateTime.now();
    String month = now.month.toString().padLeft(2, '0');
    int year = await now.year;
    print(month);
    print(year);
    Response response = await dio
        .get("http://52.90.175.175/api/prayer-time/get-by-month/$month/$year");

    if (response.data != null) {
      List<dynamic> data = response.data["data"];

      for (var prayerTime in data) {
        monthPrayerTime.add(PrayerTimeClass.fromJson(prayerTime));
      }

      setState(() {});
      print(monthPrayerTime.length);
    }
  }

  @override
  void initState() {
    prayerTimeGet();
    _fetchPrayerTimes();
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: const Text('Prayer Time'),
      ),
      body: DefaultTabController(
        length: 2, // specify the number of tabs
        child: Column(
          children: <Widget>[
            TabBar(
              indicatorColor: sec,
              labelColor: appBarColor,
              tabs: <Widget>[
                Tab(
                  text: "Today's",
                ),
                Tab(
                  text: 'Monthly',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.darken),
                        fit: BoxFit.cover,
                        image: AssetImage(prayer_timing_screen_bgimage),
                      ),
                    ),
                    child: Container(
                      child: prayerTime.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "$currentDate\nToday",
                                        style:
                                            prayer_time_table_islamic_month_tstyle,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '$cPrayerName',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          const Text(
                                            'Remaining Time',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            remingTime != null
                                                ? _timer == null
                                                    ? '0'
                                                    : '${(remingTime.inHours - _timer!.tick ~/ 3600).toString().padLeft(2, '0')}:${((remingTime.inMinutes - _timer!.tick ~/ 60) % 60).toString().padLeft(2, '0')}:${(remingTime.inSeconds - _timer!.tick) % 60}'
                                                : "0",
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
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      prayerTime: convertTo12HourFormat(
                                          prayerTime[0].fajir),
                                      prayerName: "Fajr ",
                                      iqamathTime: convertTo12HourFormat(
                                          prayerTime[0].fajir_iqamath)),
                                  PrayerimeRow(
                                      prayerTime: convertTo12HourFormat(
                                          prayerTime[0].sunrise),
                                      prayerName: "Sunrise",
                                      iqamathTime: "                   "),
                                  PrayerimeRow(
                                      prayerTime: convertTo12HourFormat(
                                          prayerTime[0].dhuhar),
                                      prayerName: "Dhuhar",
                                      iqamathTime: convertTo12HourFormat(
                                          prayerTime[0].dhuhar_iqamath)),
                                  PrayerimeRow(
                                      prayerTime: convertTo12HourFormat(
                                          prayerTime[0].asr),
                                      prayerName: "Asr   ",
                                      iqamathTime: convertTo12HourFormat(
                                          prayerTime[0].asr_iqamath)),
                                  PrayerimeRow(
                                      prayerTime: convertTo12HourFormat(
                                          prayerTime[0].magrib),
                                      prayerName: "Magrib",
                                      iqamathTime: convertTo12HourFormat(
                                          prayerTime[0].magrib_iqamath)),
                                  PrayerimeRow(
                                      prayerTime: convertTo12HourFormat(
                                          prayerTime[0].isha),
                                      prayerName: "Isha  ",
                                      iqamathTime: convertTo12HourFormat(
                                          prayerTime[0].isha_iqamath)),
                                ],
                              ),
                            ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.darken),
                        fit: BoxFit.cover,
                        image: AssetImage(prayer_timing_screen_bgimage),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView(
                            children: [
                              SingleChildScrollView(
                                child: AthanTimesByMonths(
                                    monthPrayerTime: monthPrayerTime),
                              ),
                              // SingleChildScrollView(
                              //   child: IqamaTimesByMonths(
                              //       monthPrayerTime: monthPrayerTime),
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Column(
                  //   children: [
                  //     Expanded(
                  //       child: PageView(
                  //         children: _tables,
                  //         onPageChanged: (index) {
                  //           setState(() {
                  //             _currentPageIndex = index;
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         IconButton(
                  //           icon: const Icon(
                  //             Icons.arrow_left,
                  //             color: Colors.red,
                  //           ),
                  //           onPressed: () {
                  //             if (_currentPageIndex > 0) {
                  //               setState(() {
                  //                 _currentPageIndex--;
                  //               });
                  //             }
                  //           },
                  //         ),
                  //         const SizedBox(width: 16),
                  //         IconButton(
                  //           icon: const Icon(Icons.arrow_right),
                  //           onPressed: () {
                  //             if (_currentPageIndex < _tables.length - 1) {
                  //               setState(() {
                  //                 _currentPageIndex++;
                  //               });
                  //             }
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // Add your content for the second tab here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AthanTimesByMonths extends StatelessWidget {
  const AthanTimesByMonths({
    Key? key,
    required this.monthPrayerTime,
  }) : super(key: key);

  final List<PrayerTimeClass> monthPrayerTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.05,
            color: appBarColor,
            child: Center(
              child: Text(
                DateFormat('MMMM y').format(DateTime.now()),
                textAlign: TextAlign.center,
                style: mSalah_time_title_tstyle,
              ),
            )),
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.05,
            color: sec,
            child: Center(
              child: Text(
                "Athan Timings",
                textAlign: TextAlign.center,
                style: mSalah_time_title_tstyle,
              ),
            )),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          // child: buildMonthPrayerTime(monthPrayerTime)
          child: FittedBox(
            child: DataTable(
              horizontalMargin: 8,
              columnSpacing: 4.2,
              dataRowHeight: 60.0,
              headingTextStyle: TextStyle(color: Colors.white),
              dataTextStyle: TextStyle(fontSize: 11.2, color: Colors.white),
              columns: [
                DataColumn(
                  label: Center(
                    // You can set as per your requirement.
                    child: Text(
                      'Date',
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(""),
                  // numeric: true,
                ),
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Fajr"),
                  ),
                  // numeric: true,
                ),
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text("Duhr"),
                  ),
                  // numeric: true,
                ),
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text("Asr"),
                  ),
                  // numeric: true,
                ),
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text("Magrib"),
                  ),
                  // numeric: true,
                ),
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Text("Isha"),
                  ),
                  // numeric: true,
                ),
              ],
              rows: monthPrayerTime
                  .map((prayerTime) => DataRow(
                        cells: [
                          DataCell(Container(
                            width: 50,
                            // color: Colors.amber,
                            padding: const EdgeInsets.only(
                              bottom: 23,
                            ),
                            child: Text(
                              prayerTime.date.split('-')[2],
                              style: TextStyle(fontSize: 23),
                              textAlign: TextAlign.start,
                            ),
                          )),
                          DataCell(Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 17, left: 5),
                              child: Column(
                                children: [
                                  Text("Athan"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Iqama"),
                                ],
                              ),
                            ),
                          )), // Only date
                          DataCell(Column(
                            children: [
                              Center(
                                child: Text(
                                  DateFormat.jm().format(DateFormat("hh:mm:ss")
                                      .parse(prayerTime.fajir.substring(0, 8))),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Text(
                                  DateFormat.jm().format(DateFormat("hh:mm:ss")
                                      .parse(prayerTime.fajir_iqamath
                                          .substring(0, 8))),
                                ),
                              ),
                            ],
                          )), // Only hr and min
                          DataCell(Column(
                            children: [
                              Center(
                                child: Text(
                                  DateFormat.jm().format(DateFormat("hh:mm:ss")
                                      .parse(
                                          prayerTime.dhuhar.substring(0, 8))),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Text(
                                  DateFormat.jm().format(DateFormat("hh:mm:ss")
                                      .parse(prayerTime.dhuhar_iqamath
                                          .substring(0, 8))),
                                ),
                              ),
                            ],
                          )), // Only hr and min
                          DataCell(Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    DateFormat.jm().format(
                                        DateFormat("hh:mm:ss").parse(
                                            prayerTime.asr.substring(0, 8))),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    DateFormat.jm().format(
                                        DateFormat("hh:mm:ss").parse(prayerTime
                                            .asr_iqamath
                                            .substring(0, 8))),
                                  ),
                                ),
                              ],
                            ),
                          )), // Only hr and min
                          DataCell(Container(
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    DateFormat.jm().format(
                                        DateFormat("hh:mm:ss").parse(
                                            prayerTime.magrib.substring(0, 8))),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    DateFormat.jm().format(
                                        DateFormat("hh:mm:ss").parse(prayerTime
                                            .magrib_iqamath
                                            .substring(0, 8))),
                                  ),
                                ),
                              ],
                            ),
                          )), // Only hr and min
                          DataCell(Container(
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    DateFormat.jm().format(
                                        DateFormat("hh:mm:ss").parse(
                                            prayerTime.isha.substring(0, 8))),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    DateFormat.jm().format(
                                        DateFormat("hh:mm:ss").parse(prayerTime
                                            .isha_iqamath
                                            .substring(0, 8))),
                                  ),
                                ),
                              ],
                            ),
                          )), // Only hr and min
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// class IqamaTimesByMonths extends StatelessWidget {
//   const IqamaTimesByMonths({
//     Key? key,
//     required this.monthPrayerTime,
//   }) : super(key: key);

//   final List<PrayerTimeClass> monthPrayerTime;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height * 0.05,
//             color: appBarColor,
//             child: Center(
//               child: Text(
//                 DateFormat('MMMM y').format(DateTime.now()),
//                 textAlign: TextAlign.center,
//                 style: mSalah_time_title_tstyle,
//               ),
//             )),
//         Container(
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height * 0.05,
//             color: sec,
//             child: Center(
//               child: Text(
//                 "Iqamah Timings",
//                 textAlign: TextAlign.center,
//                 style: mSalah_time_title_tstyle,
//               ),
//             )),
//         SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: DataTable(
//             columnSpacing: 10.0,
//             dataRowHeight: 50.0,
//             headingTextStyle: TextStyle(color: Colors.white),
//             dataTextStyle: TextStyle(fontSize: 12, color: Colors.white),
//             columns: [
//               DataColumn(
//                 label: Text("Date"),
//                 // numeric: true,
//               ),
//               DataColumn(
//                 label: Text("Fajr"),
//                 // numeric: true,
//               ),
//               DataColumn(
//                 label: Text("Duhr"),
//                 // numeric: true,
//               ),
//               DataColumn(
//                 label: Text("Asr"),
//                 // numeric: true,
//               ),
//               DataColumn(
//                 label: Text("Magrib"),
//                 // numeric: true,
//               ),
//               DataColumn(
//                 label: Text("Isha"),
//                 // numeric: true,
//               ),
//             ],
//             rows: monthPrayerTime
//                 .map((prayerTime) => DataRow(
//                       cells: [
//                         DataCell(Center(
//                           child: Text(prayerTime.date.split('-')[2]),
//                         )), // Only date
//                         DataCell(Center(
//                           child: Text(
//                             DateFormat.jm().format(DateFormat("hh:mm:ss").parse(
//                                 prayerTime.fajir_iqamath.substring(0, 8))),
//                           ),
//                         )), // Only hr and min
//                         DataCell(Center(
//                           child: Text(
//                             DateFormat.jm().format(DateFormat("hh:mm:ss").parse(
//                                 prayerTime.dhuhar_iqamath.substring(0, 8))),
//                           ),
//                         )), // Only hr and min
//                         DataCell(Center(
//                           child: Text(
//                             DateFormat.jm().format(DateFormat("hh:mm:ss")
//                                 .parse(prayerTime.asr_iqamath.substring(0, 8))),
//                           ),
//                         )), // Only hr and min
//                         DataCell(Center(
//                           child: Text(
//                             DateFormat.jm().format(DateFormat("hh:mm:ss").parse(
//                                 prayerTime.magrib_iqamath.substring(0, 8))),
//                           ),
//                         )), // Only hr and min
//                         DataCell(Center(
//                           child: Text(
//                             DateFormat.jm().format(DateFormat("hh:mm:ss").parse(
//                                 prayerTime.isha_iqamath.substring(0, 8))),
//                           ),
//                         )), // Only hr and min
//                       ],
//                     ))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

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
