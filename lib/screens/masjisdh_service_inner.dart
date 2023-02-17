import 'package:al_sahabah/const/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MasjidhServiceInner extends StatefulWidget {
  const MasjidhServiceInner(
      {super.key, required this.appBarTitle, required this.serviceId});

  final appBarTitle;
  final serviceId;
  @override
  State<MasjidhServiceInner> createState() => _MasjidhServiceInnerState();
}

class _MasjidhServiceInnerState extends State<MasjidhServiceInner> {
  var title = "";
  var description = "";
  getMasjidhServices() async {
    try {
      var response = await Dio()
          .get('http://52.90.175.175/api/services/get/${widget.serviceId}');
      var data = response.data["data"];
      // print(data);
      setState(() {
        title = data["title"];
        description = data["description"];
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
        title: Text(widget.appBarTitle),
      ),
      body: title == ""
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HtmlWidget(masjidhServicesText),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage("images/prayerTime.png"),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: appBarColor.withOpacity(0.5),
                      ),
                    ),
                    elevation: 0,
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
                            Text(title),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HtmlWidget(description),
                  ),
                ],
              ),
            ),
    );
  }
}
