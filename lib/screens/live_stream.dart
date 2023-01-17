import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiveStreamScreen extends StatefulWidget {
  LiveStreamScreen() : super();

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
        body: HtmlWidget('''
  <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FPalosIslamicCenter%2Fposts%2Fpfbid02nKfMXJqutxgA32GQWVwg92dNqPyxoHNTcUTFEBLWsXf8ABsiX4fvDimYPyHq8eBml&show_text=true&width=500" width="500" height="372" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
  <!-- anything goes here -->
  '''));
  }
}
