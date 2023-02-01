import 'package:dio/dio.dart';

class EventGet {
  static List<Event> events = [];
  void getEvents() async {
    try {
      var response =
          await Dio().get('http://52.90.175.175/api/events/get?page=1');

      events = (response.data["data"]["data"] as List)
          .map((i) => Event.fromJson(i))
          .toList();
    } catch (e) {
      print(e);
    }
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
