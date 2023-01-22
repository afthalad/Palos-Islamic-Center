import 'package:al_sahabah/const/const.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ask Questions'),
          elevation: 1,
          backgroundColor: const Color(0xFF66B35A),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "I want to make it private ?",
                  style: TextStyle(fontSize: 15),
                ),
                subtitle: const Text(
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
                    const Text(
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
                    side: const BorderSide(color: Colors.black12),
                  ),
                  elevation: 0,
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a question';
                        } else {
                          return null;
                        }
                      },
                      maxLines: 6, //or null
                      decoration: InputDecoration.collapsed(
                          hintText: "Write your question here...",
                          hintStyle:
                              TextStyle(fontSize: 13, color: Colors.black26)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: mWidth * 0.95,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    elevation: 0,
                    backgroundColor: const Color(0xFF0D50A3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(-10)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, submit it or do something else
                    }
                  },
                  child: Text(
                    'Submit',
                    style: newsletter_screen_buttontext_tstyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
