import 'package:al_sahabah/widgets/widgets.dart';
import 'package:flutter/material.dart';

//Signup page Screen
class VolunteerSignUpPageScreen extends StatelessWidget {
  final String pageTitle;
  final String pageSubTitle;
  final String buttonText;
  const VolunteerSignUpPageScreen({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.mHeight,
    required this.mWidth,
    required this.pageTitle,
    required this.pageSubTitle,
    required this.buttonText,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double mHeight;
  final double mWidth;

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
          title: Text("Volunteer sing up"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(
                      pageTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    subtitle: Text(pageSubTitle),
                  ),
                  const FormTextField(
                    hintText: 'Name',
                    validatorText: 'Please enter your name',
                  ),
                  const FormTextField(
                    hintText: 'Email',
                    validatorText: 'Please enter your email',
                  ),
                  const FormTextField(
                    hintText: 'Phone number',
                    validatorText: 'Please enter your phone number',
                  ),
                  const FormTextField(
                    hintText: 'Age',
                    validatorText: 'Please enter your age',
                  ),
                  const FormTextField(
                    hintText: 'Interested in',
                    validatorText: 'Please enter somthing ',
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
                        buttonText,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
