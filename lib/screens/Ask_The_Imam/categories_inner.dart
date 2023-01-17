import 'package:flutter/material.dart';

//Ask the imam - Categories in screen
class AskTheImamCategoriesScreen extends StatelessWidget {
  final String appBarTitle;
  final Widget pageWidget;
  String? catDescription;
  AskTheImamCategoriesScreen({
    super.key,
    required this.appBarTitle,
    required this.pageWidget,
    this.catDescription,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                '${appBarTitle} question and answer ',
                style: TextStyle(fontSize: 14, height: 3),
              ),
              subtitle: Text(
                catDescription.toString(),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(child: pageWidget),
          ],
        ),
      ),
    );
  }
}
