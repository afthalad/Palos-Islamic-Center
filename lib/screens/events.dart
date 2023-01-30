import 'dart:convert';
import 'package:al_sahabah/const/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key, key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<Event> events = [];

  void getHttp() async {
    try {
      var response =
          await Dio().get('http://52.90.175.175/api/events/get?page=1');
      setState(() {
        events = (response.data["data"]["data"] as List)
            .map((i) => Event.fromJson(i))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: const Color(0xFF66B35A),
          centerTitle: true,
          title: const Text('Events'),
        ),
        body: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(events[index].title),
            );
          },
        ));
  }
}

class Event {
  // final int id;
  final String title;
  // final String start;
  // final String end;
  // final String description;

  Event({
    // {required this.id,
    required this.title,
    // required this.start,
    // required this.end,
    // required this.description
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      // id: json['id'],
      title: json['title'],
      // start: json['start'],
      // end: json['end'],
      // description: json['description'],
    );
  }
}
