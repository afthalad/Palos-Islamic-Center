import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/ask_the_imam/ask_question.dart';
import 'package:al_sahabah/screens/ask_the_imam/faq_inner.dart';
import 'package:al_sahabah/screens/ask_the_imam/myquestion.dart';
import 'package:al_sahabah/screens/faq.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Ask the imam - main screen
class AskTheImamScreen extends StatefulWidget {
  const AskTheImamScreen(
      {Key? key,
      required List<Tab> tabs,
      required TabController? tabController})
      : _tabs = tabs,
        _tabController = tabController,
        super(key: key);

  final List<Tab> _tabs;
  final TabController? _tabController;

  @override
  State<AskTheImamScreen> createState() => _AskTheImamScreenState();
}

class _AskTheImamScreenState extends State<AskTheImamScreen> {
  Dio dio = Dio();
  var userToken;

  List<Categories> categories = [];

  Future fetchCategoriess() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    print(token);
    Dio dio = Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Content-Type"] = "application/json";

    Response response =
        await dio.get("http://52.90.175.175/api/questions/categories");
    var data = response.data["data"]["data"] as List;

    setState(() {
      categories = data.map((d) => Categories.fromJson(d)).toList();
      userToken = token;
    });
  }

  @override
  void initState() {
    fetchCategoriess();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: appBarColor,
          centerTitle: true,
          title: const Text('Ask the imam'),
          bottom: TabBar(
            indicatorColor: sec.withOpacity(0.3),
            tabs: widget._tabs,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TabBarView(
            controller: widget._tabController,
            children: [
              categories.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      displacement: 150,
                      backgroundColor: Colors.white,
                      color: Color.fromARGB(255, 255, 170, 0),
                      strokeWidth: 3,
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      onRefresh: () async {
                        await Future.delayed(Duration(milliseconds: 1000));
                        setState(() {});
                        ;
                      },
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int i) {
                          return AskTheImamCategories(
                            catId: categories[i].id,
                            catName: categories[i].name,
                            catDescription: categories[i].description,
                            imageUrl: categories[i].image,
                            noQuesntions: categories[i].questions.toString(),
                          );
                        },
                      ),
                    ),
              const MyQuestions(),
              FaqQuestions()
            ],
          ),
        ),
        floatingActionButton: userToken == null
            ? const Text("")
            : FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AskTheQuestionScreen()));
                },
                backgroundColor: sec,
                child: const Icon(Icons.note_alt_rounded),
              ),
      ),
    );
  }
}

class Categories {
  int id;
  String image;
  String name;
  String description;
  int questions;

  Categories({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.questions,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json["id"] ?? "",
      image: json["image"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      questions: json["questions"] ?? 0,
    );
  }
}
