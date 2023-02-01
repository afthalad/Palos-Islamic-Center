import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/faq_inner.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Ask the imam - Questions screen
class Questions extends StatefulWidget {
  const Questions({
    Key? key,
  }) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  Dio dio = Dio();
  List<FaqQuestion> faqQuestion = [];

  Future<void> fetchFaqQuestions() async {
    Response response =
        await dio.get("http://52.90.175.175/api/faqs/get?page=1");

    var data = response.data["data"]["data"] as List;

    setState(() {
      faqQuestion = data.map((d) => FaqQuestion.fromJson(d)).toList();
    });
  }

  @override
  void initState() {
    fetchFaqQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: faqQuestion.isEmpty
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Expanded(
              child: ListView.builder(
                itemCount: faqQuestion.length,
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                    onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FAQInnerScreen(
                              userId: faqQuestion[i].userId.toString(),
                              date: faqQuestion[i].date,
                              questions: faqQuestion[i].question,
                              answer: faqQuestion[i].answer,
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
                              faqQuestion[i].date.toString(),
                              style: ask_the_imam_question_date_tstyle,
                            ),
                            Text(
                              faqQuestion[i].question,
                              maxLines: 2,
                              style: ask_the_imam_question_tstyle,
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 80,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(height: double.maxFinite),
                              Text(
                                'Read More',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF0D50A3),
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

class FaqQuestion {
  int userId;
  String question;
  String answer;
  String category;
  String date;

  FaqQuestion({
    required this.question,
    required this.userId,
    required this.answer,
    required this.category,
    required this.date,
  });

  factory FaqQuestion.fromJson(Map<String, dynamic> json) {
    return FaqQuestion(
      userId: json["user_id"] ?? "",
      question: json["question"] ?? "",
      answer: json["answer"] ?? "",
      category: json["category"] ?? "",
      date: json["created_at"] ?? "",
    );
  }
}
