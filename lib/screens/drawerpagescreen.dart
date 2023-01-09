import 'package:flutter/material.dart';

class DrawerPagesScreen extends StatelessWidget {
  final String appBarTitle;
  final Widget pageWidget;
  const DrawerPagesScreen({
    super.key,
    required this.pageWidget,
    required this.appBarTitle,
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
