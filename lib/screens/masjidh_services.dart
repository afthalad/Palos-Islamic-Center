import 'package:al_sahabah/const/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart';

class MasjidhServicesScreen extends StatefulWidget {
  const MasjidhServicesScreen({super.key});

  @override
  State<MasjidhServicesScreen> createState() => _MasjidhServicesScreenState();
}

class _MasjidhServicesScreenState extends State<MasjidhServicesScreen> {
  dynamic masjidhServicesText = "";
  getMasjidhServices() async {
    try {
      var response = await Dio()
          .get('http://52.90.175.175/api/static-content/masjid-service');
      setState(() {
        masjidhServicesText = response.data["data"];
      });
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  void initState() {
    getMasjidhServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: const Text('Masjidh Services'),
      ),
      body: masjidhServicesText == ""
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HtmlWidget(masjidhServicesText),
                    // Text(
                    //   parse(masjidhServicesText).body!.text,
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}
