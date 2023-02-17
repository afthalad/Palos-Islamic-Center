import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/masjisdh_service_inner.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class MasjidhServicesScreen extends StatefulWidget {
  const MasjidhServicesScreen({super.key});

  @override
  State<MasjidhServicesScreen> createState() => _MasjidhServicesScreenState();
}

class _MasjidhServicesScreenState extends State<MasjidhServicesScreen> {
  List<Services> services = [];
  int currentPage = 1;
  dynamic masjidhServicesText = "";
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  getMasjidhServices() async {
    try {
      var response = await Dio()
          .get('http://52.90.175.175/api/services/get?page=$currentPage');
      var data = response.data["data"]["data"] as List;
      print(data);
      setState(() {
        for (var i in data) {
          services.add(Services.fromJson(i));
        }
      });
    } catch (e) {
      rethrow;
    }
    return null;
  }

  void loadNextPage() {
    setState(() {
      currentPage++;
    });
    getMasjidhServices();
  }

  @override
  void initState() {
    getMasjidhServices();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: const Text('Masjidh Services'),
      ),
      body: services.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : LazyLoadScrollView(
              onEndOfPage: () => loadNextPage(),
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int i) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MasjidhServiceInner(
                              appBarTitle: services[i].title,
                              serviceId: services[i].id,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: appBarColor.withOpacity(0.5),
                          ),
                        ),
                        elevation: 0,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.room_service,
                                  color: sec,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Text(services[i].title)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
      // _isLoading
      //     ? CircularProgressIndicator()
      //     : Container(
      //         height: 0,
      //       ),

      // : Padding(
      //     padding: const EdgeInsets.all(10),
      //     child: SingleChildScrollView(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           HtmlWidget(masjidhServicesText),
      //           // Text(
      //           //   parse(masjidhServicesText).body!.text,
      //           // ),
      //         ],
      //       ),
      //     ),
      //   ),
    );
  }
}

class Services {
  final String title;
  final int id;
  final String description;

  Services({required this.title, required this.id, required this.description});

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
