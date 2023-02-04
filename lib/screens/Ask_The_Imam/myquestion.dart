import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/my_question.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Ask the imam - MyQuestions screen
class MyQuestions extends StatefulWidget {
  const MyQuestions({
    Key? key,
  }) : super(key: key);

  @override
  State<MyQuestions> createState() => _MyQuestionsState();
}

class _MyQuestionsState extends State<MyQuestions> {
  List<MyQuestion> myQuestion = [];
  Dio dio = Dio();
  var userToke;
  Future fetchUsers() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      userToke = prefs.getString("token");

      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $userToke";
      dio.options.headers["Accept"] = "application/json";
      dio.options.headers["Content-Type"] = "application/json";

      Response response =
          await dio.get("http://52.90.175.175/api/questions/my/get");
      var data = response.data["data"]["data"] as List;
      setState(() {
        myQuestion = data.map((d) => MyQuestion.fromJson(d)).toList();
      });

      print(userToke);
    } catch (ex) {
      rethrow;
    }
  }

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: userToke == null
          ? Center(child: Text("Please signin or register"))
          : myQuestion.isEmpty
              ? Center(child: Text("you have no any question"))
              : Expanded(
                  child: ListView.builder(
                    itemCount: myQuestion.length,
                    itemBuilder: (BuildContext context, int i) {
                      return InkWell(
                        onTap: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyQuestionInnerScreen(
                                  name: myQuestion[i].name,
                                  date: myQuestion[i].date,
                                  questions: myQuestion[i].question,
                                  answer: myQuestion[i].answer,
                                ),
                              ),
                            )),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Color.fromARGB(8, 19, 19, 19),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 0,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  myQuestion[i].date.toString(),
                                  style: ask_the_imam_question_date_tstyle,
                                ),
                                Text(
                                  myQuestion[i].question,
                                  maxLines: 2,
                                  style: ask_the_imam_question_tstyle,
                                ),
                              ],
                            ),
                            trailing: SizedBox(
                              width: 80,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(height: double.maxFinite),
                                  Text(
                                    'Read More',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: sec,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: Color(0xFF0D50A3),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}

class MyQuestion {
  String name;
  String question;
  String answer;
  var category;
  String date;

  MyQuestion({
    required this.name,
    required this.question,
    required this.answer,
    required this.category,
    required this.date,
  });

  factory MyQuestion.fromJson(Map<String, dynamic> json) {
    return MyQuestion(
      name: json["user"]["name"] ?? "",
      question: json["question"] ?? "",
      answer: json["answer"] ?? "",
      category: json["question_category_id"] ?? 0,
      date: json["created_at"] ?? "",
    );
  }
}
