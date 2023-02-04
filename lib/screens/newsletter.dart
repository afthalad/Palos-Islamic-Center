import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//News letter screen
class NewsletterScreen extends StatefulWidget {
  const NewsletterScreen({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.mHeight,
    required this.mWidth,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double mHeight;
  final double mWidth;

  @override
  State<NewsletterScreen> createState() => _NewsletterScreenState();
}

class _NewsletterScreenState extends State<NewsletterScreen> {
  final TextEditingController _email = TextEditingController();
  bool isProcess = false;
  Dio dio = Dio();
  String? email;
  String getEmail = "";
  bool? news;

  subscribeNewsletter(email) async {
    setState(() {
      isProcess = true;
    });
    var response = await dio.post(
        "http://52.90.175.175/api/news-letter/subscribe",
        data: {"email": email});

    if (response.statusCode == 200 && response.data["error"] == 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("newsletter", true);
      await prefs.setString("email", email);
      print("successfully add this email $email to our newsletter");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "successfully add this email $email to our newsletter",
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
      Navigator.pushNamed(context, "/home_screen");
      setState(() {
        isProcess = false;
      });
    } else {
      setState(() {
        isProcess = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Something went wrong. Try again",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }

  unSubNewslettePost(email, existEmail) async {
    if (email != existEmail) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Please enter your email to confirm",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    } else {
      setState(() {
        isProcess = true;
      });

      final prefs = await SharedPreferences.getInstance();
      setState(() {
        email = prefs.getString("email");
      });

      var response = await dio.post(
          "http://52.90.175.175/api/news-letter/unsubscribe",
          data: {"email": email});

      if (response.statusCode == 200 && response.data["error"] == 0) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print("Successfully unsubscribed to newsletter $email");
        await prefs.setBool("newsletter", false);
        await prefs.setString("email", "");

        print(prefs.getBool(
          "newsletter",
        ));
        print(prefs.getString(
          "email",
        ));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            content: Text(
              "Successfully unsubscribed to newsletter",
              style: TextStyle(color: Colors.green),
            ),
          ),
        );
        Navigator.pushNamed(context, "/home_screen");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            content: Text(
              "Something wen wrong. Please try again",
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      }
      setState(() {
        isProcess = false;
      });
    }
  }

  subscribedNewsletterDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      news = prefs.getBool("newsletter");
      getEmail = prefs.getString("email")!;
    });
  }

  @override
  void initState() {
    subscribedNewsletterDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: appBarColor,
          centerTitle: true,
          title: const Text("News Letter"),
        ),
        body: news == false
            ? Center(child: Text("Blank page"))
            // ? SingleChildScrollView(
            //     child: Form(
            //       key: widget._formKey,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Container(
            //             width: 400,
            //             height: 200,
            //             child:
            //                 const Image(image: AssetImage('images/email.png')),
            //           ),
            //           Text(
            //             textAlign: TextAlign.center,
            //             "Subscribe Newsletter",
            //             style: newsletter_screen_title_tstyle,
            //           ),
            //           Text("Subscribe to our updates right in your inbox."),
            //           FormTextField(
            //             controller: _email,
            //             hintText: newsletter_screen_hintext,
            //             validatorText: newsletter_screen_validetext,
            //           ),
            //           SizedBox(height: widget.mHeight * 0.01),
            //           isProcess
            //               ? CircularProgressIndicator()
            //               : Container(
            //                   width: widget.mWidth * 0.95,
            //                   child: ElevatedButton(
            //                     style: ElevatedButton.styleFrom(
            //                       padding: const EdgeInsets.all(10),
            //                       elevation: 0,
            //                       backgroundColor: const Color(0xFF0D50A3),
            //                       shape: RoundedRectangleBorder(
            //                           borderRadius: BorderRadius.circular(-10)),
            //                     ),
            //                     onPressed: () async {
            //                       if (widget._formKey.currentState!
            //                           .validate()) {
            //                         await subscribeNewsletter(_email.text);
            //                       }
            //                     },
            //                     child: Text(
            //                       'Subscribe',
            //                       style: newsletter_screen_buttontext_tstyle,
            //                     ),
            //                   ),
            //                 ),
            //         ],
            //       ),
            //     ),
            //   )

            : SingleChildScrollView(
                child: Form(
                  key: widget._formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 400,
                        height: 200,
                        child:
                            const Image(image: AssetImage('images/email.png')),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        news != null
                            ? "$getEmail subscribed to our newsletter "
                            : "NO subscribed yet",
                        style: newsletter_screen_title_tstyle,
                      ),
                      Text(newsletter_screen_subtitle),
                      FormTextField(
                        controller: _email,
                        hintText: newsletter_screen_hintext,
                        validatorText: newsletter_screen_validetext,
                      ),
                      SizedBox(height: widget.mHeight * 0.01),
                      isProcess
                          ? CircularProgressIndicator()
                          : Container(
                              width: widget.mWidth * 0.95,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                  elevation: 0,
                                  backgroundColor: sec,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(-10)),
                                ),
                                onPressed: () {
                                  if (widget._formKey.currentState!
                                      .validate()) {
                                    unSubNewslettePost(_email.text, getEmail);
                                  }
                                },
                                child: Text(
                                  'Unsubscribe',
                                  style: newsletter_screen_buttontext_tstyle,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
