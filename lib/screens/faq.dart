import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/ask_the_imam/faq_inner.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// Ask the imam - FaqQuestions screen
class FaqQuestions extends StatefulWidget {
  FaqQuestions({
    Key? key,
  }) : super(key: key);

  @override
  State<FaqQuestions> createState() => _FaqQuestionsState();
}

class _FaqQuestionsState extends State<FaqQuestions> {
  Dio dio = Dio();
  List<FaqQuestion> faqQuestion = [];
  int currentPage = 1;

  Future<void> fetchFaqFaqQuestions() async {
    Response response =
        await dio.get("http://52.90.175.175/api/faqs/get?page=$currentPage");

    var data = response.data["data"]["data"] as List;
    setState(() {
      faqQuestion.addAll(data.map((i) => FaqQuestion.fromJson(i)).toList());
    });
  }

  @override
  void initState() {
    fetchFaqFaqQuestions();
    super.initState();
  }

  void loadNextPage() {
    setState(() {
      currentPage++;
    });
    fetchFaqFaqQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return faqQuestion.isEmpty
        ? Text("data")
        : Expanded(
            child: faqQuestion.isEmpty
                ? Center(
                    child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()))
                : LazyLoadScrollView(
                    onEndOfPage: () => loadNextPage(),
                    child: ListView.builder(
                      itemCount: faqQuestion.length,
                      itemBuilder: (BuildContext context, int i) {
                        return InkWell(
                          onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FAQInnerScreen(
                                    userId: "user",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      color: sec,
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
  String question;
  String answer;

  String date;

  FaqQuestion({
    required this.question,
    required this.answer,
    required this.date,
  });

  factory FaqQuestion.fromJson(Map<String, dynamic> json) {
    return FaqQuestion(
      question: json["question"] ?? "",
      answer: json["answer"] ?? "",
      date: json["created_at"] ?? "",
    );
  }
}
