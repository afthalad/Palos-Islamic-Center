import 'package:al_sahabah/const/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              aboutUsText == ""
                  ? const Center(child: CircularProgressIndicator())
                  : Text(
                      parse(aboutUsText).body!.text,
                      style: aboutus_screen_heading_tstyle,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
