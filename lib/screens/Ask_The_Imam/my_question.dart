import 'package:flutter/material.dart';

// Ask the imam - FAQ inner screen
class MyQuestionInnerScreen extends StatefulWidget {
  String date;
  String questions;
  String answer;
  String name;
  MyQuestionInnerScreen({
    Key? key,
    required this.date,
    required this.questions,
    required this.answer,
    required this.name,
  }) : super(key: key);

  @override
  State<MyQuestionInnerScreen> createState() => _MyQuestionInnerScreenState();
}

class _MyQuestionInnerScreenState extends State<MyQuestionInnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
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
                      widget.name,
                      style: const TextStyle(fontSize: 12),
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
                      widget.answer == ""
                          ? Text("Not yet answered. Please be petients")
                          : Text(widget.answer),
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
