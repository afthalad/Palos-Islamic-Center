import 'package:al_sahabah/const/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({super.key});

  @override
  LiveStreamScreenState createState() => LiveStreamScreenState();
}

class LiveStreamScreenState extends State<LiveStreamScreen> {
  Future<String> liveStreamUrlGet() async {
    Dio dio = Dio();
    Response response =
        await dio.get("http://52.90.175.175/api/static-content/live-stream");
    if (response.statusCode == 200) {
      return response.data["data"];
    } else {
      throw Exception('Failed to load live stream');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: const Text('Live Stream'),
      ),
      body: FutureBuilder(
        future: liveStreamUrlGet(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: HtmlWidget(snapshot.data!),
            );
          } else if (snapshot.hasError) {
            return Text('Failed to load header images');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
