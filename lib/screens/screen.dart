// import 'package:flutter/material.dart';

// //Remaining salah time Widget__
// class SalahTimeRemingWidget extends StatefulWidget {
//   const SalahTimeRemingWidget({
//     Key? key,
//     required this.mHeight,
//   }) : super(key: key);

//   final double mHeight;

//   @override
//   State<SalahTimeRemingWidget> createState() => _SalahTimeRemingWidgetState();
// }

// class _SalahTimeRemingWidgetState extends State<SalahTimeRemingWidget> {
//   Dio dio = Dio();
//   static List<PrayerTimeClass> prayerTime = [];
//   String currentDate = "";
//   var time = DateTime.now();
//   String cPrayerName = "";
//   var cPrayerTime = "";
//   var remingTime;
//   Timer? _timer;

//   Future fetchPrayerTime() async {
//     String year = DateTime.now().year.toString();
//     String month = DateTime.now().month.toString().padLeft(2, '0');
//     String day = DateTime.now().day.toString().padLeft(2, '0');
//     var time = DateTime.now();
//     setState(() {
//       currentDate = "$year-$month-$day";
//     });

//     // include current data in admin panel $currentDate
//     Response response =
//         await dio.get("http://52.90.175.175/api/prayer-time/get/$currentDate");

//     if (response.data["data"] != null) {
//       prayerTime.add(PrayerTimeClass.fromJson(response.data["data"]));

//       DateTime fajirTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
//           "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].fajir}");
//       DateTime dhuhrTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
//           "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].dhuhar}");
//       DateTime asrTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
//           "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].asr}");
//       DateTime magribTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
//           "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].magrib}");
//       DateTime ishaTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
//           "${DateTime.now().toString().substring(0, 10)} ${prayerTime[0].isha}");
//       DateTime now = DateTime.now();

//       if (now.isBefore(fajirTime)) {
//         setState(() {
//           cPrayerName = "Fajr";
//           cPrayerTime = DateFormat.Hms().format(fajirTime);
//           remingTime = fajirTime.difference(now);
//         });
//       } else if (now.isAfter(fajirTime) && now.isBefore(dhuhrTime)) {
//         setState(() {
//           cPrayerName = "Duhur";
//           cPrayerTime = DateFormat.Hms().format(dhuhrTime);
//           remingTime = dhuhrTime.difference(now).toString().split('.')[0];
//         });
//       } else if (now.isAfter(dhuhrTime) && now.isBefore(asrTime)) {
//         setState(() {
//           cPrayerName = "Asr";
//           cPrayerTime = DateFormat.Hms().format(asrTime);
//           remingTime = asrTime.difference(now);
//         });
//       } else if (now.isAfter(asrTime) && now.isBefore(magribTime)) {
//         setState(() {
//           cPrayerName = "Magrib";
//           cPrayerTime = DateFormat.Hms().format(magribTime);
//           remingTime = magribTime.difference(now);
//         });
//       } else if (now.isAfter(magribTime) && now.isBefore(ishaTime)) {
//         setState(() {
//           cPrayerName = "Isha";
//           cPrayerTime = DateFormat.Hms().format(ishaTime);
//           remingTime = ishaTime.difference(now);
//         });
//       } else {
//         setState(() {
//           cPrayerName = "Fajr";
//         });
//       }
//     }

//     // print(
//     //     "${remingTime.inHours}:${remingTime.inMinutes.remainder(60)}:${(remingTime.inSeconds.remainder(60))}");
//   }

//   @override
//   void initState() {
//     fetchPrayerTime();

//     super.initState();
//     // _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//     //   setState(() {});
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       height: widget.mHeight * 0.11,
//       color: mSalah_time_container_color,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // remingTime == null
//           //     ? Text("")
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Text(
//               //   _timer == null
//               //       ? '0'
//               //       : '${(remingTime.inHours - _timer!.tick ~/ 3600).toString().padLeft(2, '0')}:${((remingTime.inMinutes - _timer!.tick ~/ 60) % 60).toString().padLeft(2, '0')}:${(remingTime.inSeconds - _timer!.tick) % 60}',
//               //   style: TextStyle(fontSize: 20),
//               // ),
//               // ElevatedButton(
//               //     onPressed: () {
//               //       print(remingTime.inHours);
//               //       Navigator.push(
//               //           context,
//               //           MaterialPageRoute(
//               //               builder: (context) => RunningDuration(
//               //                     duration: remingTime,
//               //                   )));
//               //     },
//               //     child: Text("asds")),
//               Text(
//                 '${cPrayerName} at  ${cPrayerTime}',
//                 style: mSalah_time_subtitle_tstyle,
//               ),
//               Text(
//                 // remingTime == null
//                 //     ? "0"
//                 //     : _timer == null
//                 //         ? '0'
//                 //         : 'Remining time  ${(remingTime.inHours - _timer!.tick ~/ 3600).toString().padLeft(2, '0')}:${((remingTime.inMinutes - _timer!.tick ~/ 60) % 60).toString().padLeft(2, '0')}:${(remingTime.inSeconds - _timer!.tick) % 60}',
//                 "Remining time ${remingTime.inHours}:${remingTime.inMinutes.remainder(60)}:${(remingTime.inSeconds.remainder(60))}",

//                 style: mSalah_time_title_tstyle,
//               ),
//             ],
//           ),
//           Container(
//             padding: const EdgeInsets.all(5),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.white30,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: InkWell(
//               onTap: () {
//                 Navigator.pushNamed(context, "/prayer_time_screen");
//               },
//               child: Text(
//                 "see more",
//                 style: mSalah_time_subtitle_tstyle,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
