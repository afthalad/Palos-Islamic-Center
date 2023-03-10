// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'package:al_sahabah/const/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key, key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<Event> events = [];
  int currentPage = 1;
  Dio dio = Dio();

  getEvents() async {
    try {
      var response = await Dio()
          .get('http://52.90.175.175/api/events/get?page=$currentPage');
      var data = response.data["data"]["data"] as List;
      setState(() {
        events.addAll(data.map((i) => Event.fromJson(i)).toList());
      });
    } catch (e) {
      print(e);
      print(events.length);
    }
  }

  loadNextPage() {
    currentPage = currentPage + 1;
    getEvents();
    // print("DASDSADS:${currentPage}");
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
      body: events.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: LazyLoadScrollView(
                onEndOfPage: () => loadNextPage(),
                child: RefreshIndicator(
                  displacement: 150,
                  backgroundColor: Colors.white,
                  color: Color.fromARGB(255, 255, 170, 0),
                  strokeWidth: 3,
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  onRefresh: () async {
                    await Future.delayed(Duration(milliseconds: 1000));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => super.widget));
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.black26,
                    ),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.all(20),
                        title: Text(events[index].title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(events[index].description),
                            Text(
                                "${events[index].start} - ${events[index].end}"),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
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
