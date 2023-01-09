import 'package:flutter/material.dart';

class FeautreScreen extends StatelessWidget {
  final String appBarTitle;
  final Widget pageWidget;
  FeautreScreen({
    super.key,
    required this.appBarTitle,
    required this.pageWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: Text(appBarTitle),
      ),
      body: pageWidget,
    );
  }
}
