import 'package:dio/dio.dart';

class EventGet {
  List<Event> events = [];
  int currentPage = 1;

  Dio dio = Dio();

  getEvents() async {
    try {
      var response = await Dio()
          .get('http://52.90.175.175/api/events/get?page=$currentPage');
      var data = response.data["data"]["data"] as List;

      events.addAll(data.map((i) => Event.fromJson(i)).toList());
    } catch (e) {}
  }

  loadNextPage() {
    currentPage = currentPage + 1;
    getEvents();
    print("DASDSADS:${currentPage}");
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
