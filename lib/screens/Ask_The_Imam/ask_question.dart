import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/homescreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//ASk the imam - Ask question screen
class AskTheQuestionScreen extends StatefulWidget {
  const AskTheQuestionScreen({
    super.key,
  });

  @override
  State<AskTheQuestionScreen> createState() => _AskTheQuestionScreenState();
}

class _AskTheQuestionScreenState extends State<AskTheQuestionScreen> {
  bool _switchValue = false;
  var _switchValueInt;
  int? selectedCategoryId;
  String question = "";
  Dio dio = Dio();
  var userToken;
  Categories? selectedCategory;
  bool isProcess = false;

  List<Categories> categories = [];

  void setSwitchValueInt(bool switchValue) {
    setState(() {
      _switchValueInt = switchValue ? 1 : 0;
    });
  }

  Future<void> fetchCategoriess() async {
    Response response =
        await dio.get("http://52.90.175.175/api/questions/categories");
    final prefs = await SharedPreferences.getInstance();

    var data = response.data["data"]["data"] as List;

    setState(() {
      categories = data.map((d) => Categories.fromJson(d)).toList();
    });

    print(categories.runtimeType);
  }

  @override
  void initState() {
    fetchCategoriess();
    if (categories.length > 0) {
      selectedCategory = categories[0];
    }
    super.initState();
  }

  askQuestion(question, private, questionCategoryId) async {
    Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Content-Type"] = "application/json";

    var response = await dio.post(
      "http://52.90.175.175/api/questions/my/ask",
      data: {
        "question": question,
        "private": private,
        "question_category_id": questionCategoryId
      },
    );

    if (response.statusCode == 200 && response.data['error'] == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Question sent sucessfully",
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
    } else {
      setState(() {
        isProcess = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Make sure it's 20 words longer",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }

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
                      setSwitchValueInt(value);
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
                    DropdownButton<Categories>(
                      hint: Text('Select Category'),
                      value: selectedCategory,
                      onChanged: (Categories? value) {
                        setState(() {
                          selectedCategory = value;
                          selectedCategoryId = value?.id;
                        });
                      },
                      items: categories.map((Categories category) {
                        return DropdownMenuItem<Categories>(
                          value: category,
                          child: Text("${category.name} (${category.id})"),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       print(_switchValueInt);
              //     },
              //     child: Text("asd")),
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a question';
                        } else {
                          setState(() {
                            question = value;
                          });
                          ;
                        }
                      },
                      maxLines: 6, //or null
                      decoration: const InputDecoration.collapsed(
                          hintText: "Write your question here...",
                          hintStyle:
                              TextStyle(fontSize: 13, color: Colors.black26)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              isProcess
                  ? CircularProgressIndicator()
                  : Container(
                      width: mWidth * 0.95,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          elevation: 0,
                          backgroundColor: const Color(0xFF0D50A3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(-10)),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isProcess = true;
                            });
                            await askQuestion(question, _switchValue,
                                selectedCategoryId ?? 8);
                            setState(() {
                              isProcess = true;
                            });
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

class Categories {
  int id;
  String name;

  Categories({
    required this.id,
    required this.name,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
    );
  }
}
