import 'package:al_sahabah/const/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

//About us page screen
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  dynamic aboutUsText = "";
  getAboutUs() async {
    try {
      var response =
          await Dio().get('http://52.90.175.175/api/static-content/about');
      setState(() {
        aboutUsText = response.data["data"];
      });
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  void initState() {
    getAboutUs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: const Text("About us"),
      ),
      body: aboutUsText == ""
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [HtmlWidget(aboutUsText)],
                ),
              ),
            ),
    );
  }
}
