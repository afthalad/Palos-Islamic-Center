// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/models/events.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key, key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<Event> events = [];
  void getEvents() async {
    try {
      var response =
          await Dio().get('http://52.90.175.175/api/events/get?page=1');
      var data = response.data["data"]["data"] as List;
      setState(() {
        events = data.map((i) => Event.fromJson(i)).toList();
      });

      print(events);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getEvents();
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
      // body: ListView.builder(
      //   itemCount: events.length,
      //   itemBuilder: (BuildContext context, int i) {
      //     return ListTile(title: Text(events[i].title),subtitle: Text(events[i].),);
      //   },
      // ),
      body: events.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  title: Text(events[index].title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(events[index].description),
                      Text("${events[index].start} - ${events[index].end}"),
                    ],
                  ),
                );
              },
            ),
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
