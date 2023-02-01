import 'package:al_sahabah/const/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//Contace Us Details
class ContaceusDetailsScreen extends StatefulWidget {
  const ContaceusDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ContaceusDetailsScreen> createState() => _ContaceusDetailsScreenState();
}

class _ContaceusDetailsScreenState extends State<ContaceusDetailsScreen> {
  Dio dio = Dio();
  List<Person> persons = [];

  Future<void> fetchPersons() async {
    Response response =
        await dio.get("http://52.90.175.175/api/static-content/contact-us");

    Map<String, dynamic> data = response.data["data"];
    setState(() {
      persons = data.values.map((e) => Person.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    fetchPersons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: const Text("Contact us"),
      ),
      body: persons.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: persons.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black12, width: 0.5),
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(persons[i].name,
                                style: contactus_screen_profile_tstyle1),
                            Text(
                              persons[i].title,
                              style: contactus_screen_profile_tstyle1,
                            ),
                          ],
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              persons[i].email,
                              style: contactus_screen_profile_tstyle,
                            ),
                            Text(
                              "${persons[i].phone1} , ${persons[i].phone2}",
                              style: contactus_screen_profile_tstyle,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}

class Person {
  String name;
  String title;
  String email;
  String phone1;
  String phone2;

  Person({
    required this.name,
    required this.title,
    required this.email,
    required this.phone1,
    required this.phone2,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json["name"] ?? "",
      title: json["title"] ?? "",
      email: json["email"] ?? "",
      phone1: json["phone1"] ?? "",
      phone2: json["phone2"] ?? "",
    );
  }
}
