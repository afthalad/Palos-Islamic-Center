import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/masjisdh_service_inner.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MasjidhServicesScreen extends StatefulWidget {
  const MasjidhServicesScreen({super.key});

  @override
  State<MasjidhServicesScreen> createState() => _MasjidhServicesScreenState();
}

class _MasjidhServicesScreenState extends State<MasjidhServicesScreen> {
  dynamic masjidhServicesText = "";
  getMasjidhServices() async {
    try {
      var response = await Dio()
          .get('http://52.90.175.175/api/static-content/masjid-service');
      setState(() {
        masjidhServicesText = response.data["data"];
      });
    } catch (e) {
      rethrow;
    }
    return null;
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
      body: masjidhServicesText == ""
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int i) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MasjidhServiceInner(
                                  appBarTitle: "Community sevices",
                                )));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: appBarColor.withOpacity(0.5),
                      ),
                    ),
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Text("Community services")
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),

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
