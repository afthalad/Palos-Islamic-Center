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

  @override
  void initState() {
    super.initState();
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

      body: FutureBuilder(
        future: eventGet.getEvents(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return eventGet.events.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LazyLoadScrollView(
                    onEndOfPage: () {
                      eventGet.loadNextPage();
                    },
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
                );
        },
      ),
      // body: events.isEmpty
      //     ? const Center(child: CircularProgressIndicator())
      //     : Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: LazyLoadScrollView(
      //           onEndOfPage: () => loadNextPage(),
      //           child: ListView.separated(
      //             separatorBuilder: (context, index) => const Divider(
      //               color: Colors.black26,
      //             ),
      //             itemCount: events.length,
      //             itemBuilder: (context, index) {
      //               return ListTile(
      //                 contentPadding: const EdgeInsets.all(20),
      //                 title: Text(events[index].title),
      //                 subtitle: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(events[index].description),
      //                     Text("${events[index].start} - ${events[index].end}"),
      //                   ],
      //                 ),
      //               );
      //             },
      //           ),
      //         ),
      //       ),
    );
  }
}

class Event {
  final String title;
  final String start;
  final String end;
  final String description;

  Event(
      {required this.title,
      required this.start,
      required this.end,
      required this.description});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      start: json['start'],
      end: json['end'],
      description: json['description'],
    );
  }
}
