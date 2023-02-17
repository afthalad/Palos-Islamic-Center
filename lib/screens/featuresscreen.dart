import 'package:al_sahabah/const/const.dart';
import 'package:flutter/material.dart';

class FeautreScreen extends StatefulWidget {
  final String appBarTitle;
  final Widget pageWidget;
  const FeautreScreen({
    super.key,
    required this.appBarTitle,
    required this.pageWidget,
  });

  @override
  State<FeautreScreen> createState() => _FeautreScreenState();
}

class _FeautreScreenState extends State<FeautreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text(widget.appBarTitle),
      ),
      body: widget.pageWidget,
    );
  }
}
