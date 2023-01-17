import 'package:al_sahabah/const/const.dart';
import 'package:flutter/material.dart';

//Contace Us Details
class ContaceusDetailsScreen extends StatelessWidget {
  const ContaceusDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: const Text("Contact us"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 0.5),
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading:  CircleAvatar(
                  backgroundImage: NetworkImage(
                     contactus_screen_profile),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(contactus_screen_profile_name,
                        style: contactus_screen_profile_name_tstyle),
                    Text(
                     contactus_screen_profile_post,
                      style: contactus_screen_profile_tstyle,
                    ),
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(contactus_screen_profile_email,
                        style: contactus_screen_profile_tstyle),
                    Text(contactus_screen_profile_phone, style: contactus_screen_profile_tstyle),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
