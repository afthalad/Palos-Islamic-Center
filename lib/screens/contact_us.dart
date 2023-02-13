import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/widgets/widgets.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String question = "";
  bool isProcess = false;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _question = TextEditingController();

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
          backgroundColor: appBarColor,
          centerTitle: true,
          title: const Text("Contact us")),
      body: persons.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Connect with us"),
                          subtitle: Text(
                              "Connect directly with the right person for your inquiry using ours"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ContactUsSocial(
                              image: "images/icon-facebook.png",
                              title: "Facebook",
                              link: m_features_card2_facebook_web_url,
                            ),
                            ContactUsSocial(
                              image: "images/icon-youtube..png",
                              title: "Youtube",
                              link: m_features_card2_youtube_web_url,
                            ),
                            ContactUsSocial(
                              image: "images/icon-instagram.png",
                              title: "Instagram",
                              link: m_features_card2_instagram_web_url,
                            ),
                          ],
                        ),
                        FormTextField(
                          hintText: 'Name',
                          validatorText: 'Please enter your name',
                          controller: _name,
                          textInputType: TextInputType.name,
                        ),
                        FormTextField(
                          hintText: 'Email',
                          validatorText: 'Please enter your email',
                          controller: _email,
                          textInputType: TextInputType.name,
                        ),
                        FormTextField(
                          hintText: 'Age',
                          validatorText: 'Please enter your age',
                          controller: _question,
                          textInputType: TextInputType.number,
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
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your question';
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
                                    hintStyle: TextStyle(
                                        fontSize: 13, color: Colors.black26)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        isProcess
                            ? CircularProgressIndicator()
                            : Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(10),
                                    elevation: 0,
                                    backgroundColor: sec,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(-10)),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        isProcess = true;
                                      });

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
                  SizedBox(
                    height: 10,
                  ),
                  // ListTile(
                  //   title: Text(
                  //       "Connect directly with the right person for your inquiry using our"),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: persons.length,
                        itemBuilder: (context, i) {
                          return Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.black12, width: 0.5),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          ;
                        }),
                  )
                ],
              ),
            ),
    );
  }
}

//  persons.isEmpty
//             ? const Center(child: CircularProgressIndicator())
//             : Padding(
//               padding: const EdgeInsets.all(10),
//               child: ListView.builder(
//                   itemCount: persons.length,
//                   itemBuilder: (BuildContext context, int i) {
//                     return Container(
//                       decoration: const BoxDecoration(
//                         border: Border(
//                           bottom: BorderSide(
//                               color: Colors.black12, width: 0.5),
//                         ),
//                       ),
//                       child: ListTile(
//                         contentPadding: const EdgeInsets.all(10),
//                         title: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(persons[i].name,
//                                 style: contactus_screen_profile_tstyle1),
//                             Text(
//                               persons[i].title,
//                               style: contactus_screen_profile_tstyle1,
//                             ),
//                           ],
//                         ),
//                         subtitle: Column(
//                           mainAxisAlignment:
//                               MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               persons[i].email,
//                               style: contactus_screen_profile_tstyle,
//                             ),
//                             Text(
//                               "${persons[i].phone1} , ${persons[i].phone2}",
//                               style: contactus_screen_profile_tstyle,
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             )

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
