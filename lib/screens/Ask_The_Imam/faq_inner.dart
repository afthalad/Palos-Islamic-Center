import 'package:al_sahabah/const/const.dart';
import 'package:flutter/material.dart';

// Ask the imam - FAQ inner screen
class FAQInnerScreen extends StatefulWidget {
  String? userId;
  String date;
  String questions;
  String answer;
  FAQInnerScreen({
    Key? key,
    this.userId,
    required this.date,
    required this.questions,
    required this.answer,
  }) : super(key: key);

  @override
  State<FAQInnerScreen> createState() => _FAQInnerScreenState();
}

class _FAQInnerScreenState extends State<FAQInnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text("Question"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Colors.black12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userId ?? "user",
                      style: const TextStyle(fontSize: 10),
                    ),
                    Text(
                      widget.date,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const Divider(),
                    Text(widget.questions),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Colors.black12),
              ),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.answer == ""
                          ? "Not yet answered"
                          : widget.answer),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
