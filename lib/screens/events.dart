// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/services/events_get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key, key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  EventGet eventGet = EventGet();
  // List<Event> events = [];
  // int currentPage = 1;

  // Dio dio = Dio();

  // void getEvents() async {
  //   try {
  //     var response = await Dio()
  //         .get('http://52.90.175.175/api/events/get?page=$currentPage');
  //     var data = response.data["data"]["data"] as List;
  //     setState(() {
  //       events.addAll(data.map((i) => Event.fromJson(i)).toList());
  //     });

  //     print(events);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void loadNextPage() {
  //   setState(() {
  //     currentPage++;
  //   });
  //   print(currentPage);
  //   getEvents();
  // }

  @override
  void initState() {
    super.initState();
    eventGet.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: const Text('Events'),
      ),
      body: eventGet.events.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: LazyLoadScrollView(
                onEndOfPage: () => eventGet.loadNextPage(),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black26,
                  ),
                  itemCount: eventGet.events.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(20),
                      title: Text(eventGet.events[index].title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(eventGet.events[index].description),
                          Text(
                              "${eventGet.events[index].start} - ${eventGet.events[index].end}"),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}

// class Event {
//   final String title;
//   final String start;
//   final String end;
//   final String description;

//   Event(
//       {required this.title,
//       required this.start,
//       required this.end,
//       required this.description});

//   factory Event.fromJson(Map<String, dynamic> json) {
//     return Event(
//       title: json['title'],
//       start: json['start'],
//       end: json['end'],
//       description: json['description'],
//     );
//   }
// }
