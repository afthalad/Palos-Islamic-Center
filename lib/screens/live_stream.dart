import 'package:al_sahabah/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({super.key});

  final String title = "Video Demo";

  @override
  LiveStreamScreenState createState() => LiveStreamScreenState();
}

class LiveStreamScreenState extends State<LiveStreamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: const Color(0xFF66B35A),
          centerTitle: true,
          title: const Text('Live Stream'),
        ),
        body: HtmlWidget(live_stream_screen_video_iframe));
  }
}
