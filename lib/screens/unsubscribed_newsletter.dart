import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//News letter screen
class UnSubNewsletterScreen extends StatefulWidget {
  const UnSubNewsletterScreen({
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
  State<UnSubNewsletterScreen> createState() => _NewsletterScreenState();
}

class _NewsletterScreenState extends State<UnSubNewsletterScreen> {
  final TextEditingController _email = TextEditingController();
  bool isProcess = false;
  Dio dio = Dio();
  newslettePost(email) async {
    setState(() {
      isProcess = true;
    });
    var response = await dio.post(
        "http://52.90.175.175/api/news-letter/subscribe",
        data: {"email": email});
    var response2 = await dio.get(
      "http://52.90.175.175/api/news-letter/subscribe",
    );

    if (response.statusCode == 200 && response.data["error"] == 0) {
      print(response2.data["message"]);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Successfully registered to newsletter",
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: const Color(0xFF66B35A),
          centerTitle: true,
          title: const Text("News Letter"),
        ),
        body: Form(
          key: widget._formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 200,
                child: const Image(image: AssetImage('images/email.png')),
              ),
              Text(
                un_newsletter_screen_title,
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
                          backgroundColor: const Color(0xFF0D50A3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(-10)),
                        ),
                        onPressed: () {
                          if (widget._formKey.currentState!.validate()) {
                            newslettePost(_email.text);
                          }
                        },
                        child: Text(
                          'Subscribe',
                          style: newsletter_screen_buttontext_tstyle,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
