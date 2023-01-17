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
        title: Text("News Letter"),
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
              child: Image(image: AssetImage('images/email.png')),
            ),
            Text(
              'Subscribe Newsletter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Subscribe to our updates right in your inbox.'),
            FormTextField(
              hintText: 'Email',
              validatorText: 'Please enter email to subscribe',
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
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
