import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:flutter/material.dart';

//News letter screen
class NewsletterScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: const Text("News Letter"),
      ),
      body: Form(
        key: _formKey,
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
             newsletter_screen_title,
              style: newsletter_screen_title_tstyle,
            ),
            Text(newsletter_screen_subtitle),
            FormTextField(
              hintText: newsletter_screen_hintext,
              validatorText: newsletter_screen_validetext,
            ),
            SizedBox(height: mHeight * 0.01),
            Container(
              width: mWidth * 0.95,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  elevation: 0,
                  backgroundColor: const Color(0xFF0D50A3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(-10)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, submit it or do something else
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
    );
  }
}
