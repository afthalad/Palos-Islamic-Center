import 'package:al_sahabah/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

//About us page screen
class FeaturesFromApi extends StatefulWidget {
  const FeaturesFromApi({
    Key? key,
    required this.appBarTitle,
    required this.pageText,
  }) : super(key: key);

  final String appBarTitle;
  final String pageText;

  @override
  State<FeaturesFromApi> createState() => _FeaturesFromApiState();
}

class _FeaturesFromApiState extends State<FeaturesFromApi> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.dark, // For iOS (dark icons)
          ),
          elevation: 1,
          backgroundColor: appBarColor,
          centerTitle: true,
          title: Text(widget.appBarTitle)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [HtmlWidget(widget.pageText)],
          ),
        ),
      ),
    );
  }
}
