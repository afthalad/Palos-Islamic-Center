import 'package:al_sahabah/const/const.dart';
import 'package:flutter/material.dart';

// Ask the imam - Question inner screen
class QuestionsInnerScreen extends StatelessWidget {
  final String appBarTittle;
  final Widget pageWidget;
  const QuestionsInnerScreen({
    Key? key,
    required this.appBarTittle,
    required this.pageWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: appBarColor,
          centerTitle: true,
          title: Text(appBarTittle),
        ),
        body: pageWidget);
  }
}
