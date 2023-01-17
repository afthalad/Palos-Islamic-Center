import 'package:flutter/material.dart';

//ASk the imam - Ask question screen
class AskTheQuestionScreen extends StatefulWidget {
  const AskTheQuestionScreen({
    super.key,
  });

  @override
  State<AskTheQuestionScreen> createState() => _AskTheQuestionScreenState();
}

class _AskTheQuestionScreenState extends State<AskTheQuestionScreen> {
  String dropdownValue = 'Fiqh of the family';
  List<String> dropDownOptions = [
    'Fiqh of the family',
    "Hadeeth & it's science",
    'Ithikaaf',
    'Knowladge & propagat',
    'Mosque issues',
    'Prayer',
    'Other',
  ];
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Questions'),
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              "I want to make it private ?",
              style: TextStyle(fontSize: 15),
            ),
            subtitle: Text(
              "Control the privacy of your question",
              style: TextStyle(fontSize: 11),
            ),
            trailing: Switch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select category',
                  style: TextStyle(color: Colors.black54),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: dropDownOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.black12),
              ),
              elevation: 0,
              color: Colors.white.withOpacity(0.9),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 6, //or null
                  decoration: InputDecoration.collapsed(
                      hintText: "Write your question here...",
                      hintStyle:
                          TextStyle(fontSize: 13, color: Colors.black26)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
