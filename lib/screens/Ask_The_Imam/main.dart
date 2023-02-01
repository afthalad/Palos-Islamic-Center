import 'package:al_sahabah/screens/Ask_The_Imam/ask_question.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/faq_inner.dart';
import 'package:al_sahabah/screens/faq.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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

  List<Categories> categories = [];

  Future<void> fetchCategoriess() async {
    Response response =
        await dio.get("http://52.90.175.175/api/questions/categories");

    var data = response.data["data"]["data"] as List;

    setState(() {
      categories = data.map((d) => Categories.fromJson(d)).toList();
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
          backgroundColor: const Color(0xFF66B35A),
          centerTitle: true,
          title: const Text('Ask the imam'),
          bottom: TabBar(
            indicatorColor: const Color(0xFF0D50A3).withOpacity(0.3),
            tabs: widget._tabs,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TabBarView(
            controller: widget._tabController,
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int i) {
                  return AskTheImamCategories(
                    catName: categories[i].name,
                    catDescription: categories[i].description,
                    imageUrl: categories[i].image,
                    noQuesntions: categories[i].questions.toString(),
                  );
                  ;
                },
              ),
              const Questions()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AskTheQuestionScreen()));
          },
          backgroundColor: Colors.green,
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
