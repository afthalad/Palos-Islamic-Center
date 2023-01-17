import 'package:al_sahabah/const/const.dart';
import 'package:flutter/material.dart';

//About us page screen
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: Text("About us"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
               aboutus_screen_heading_1,
                style: aboutus_screen_heading_tstyle,
              ),
              Text(
                aboutus_screen_paragraph_1,
              ),
              Text(
                aboutus_screen_heading_2,
                style: aboutus_screen_heading_tstyle,
              ),
              Text(
               aboutus_screen_paragraph_2,
              ),
              Text(
              aboutus_screen_heading_3,
                style: aboutus_screen_heading_tstyle,
              ),
              Text(
                  aboutus_screen_paragraph_3),
            ],
          ),
        ),
      ),
    );
  }
}
