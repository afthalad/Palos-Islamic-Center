import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/services/authenticaition.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//Signup page Screen
class VolunteerRequest extends StatefulWidget {
  final String pageTitle;
  final String pageSubTitle;
  final String buttonText;
  VolunteerRequest(
      {Key? key,
      required GlobalKey<FormState> formKey,
      required this.mHeight,
      required this.mWidth,
      required this.pageTitle,
      required this.pageSubTitle,
      required this.buttonText})
      : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double mHeight;
  final double mWidth;

  @override
  State<VolunteerRequest> createState() => _VolunteerRequestState();
}

class _VolunteerRequestState extends State<VolunteerRequest> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _phone = TextEditingController();

  final TextEditingController _age = TextEditingController();

  bool singupProcess = false;

  @override
  Widget build(BuildContext context) {
    Auth authentication = Auth(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: appBarColor,
          centerTitle: true,
          title: const Text("Volunteer sing up"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Form(
              key: widget._formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(
                      widget.pageTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    subtitle: Text(widget.pageSubTitle),
                  ),
                  FormTextField(
                      hintText: 'Name',
                      validatorText: 'Please enter your name',
                      controller: _name,
                      textInputType: TextInputType.name),
                  FormTextField(
                    hintText: 'Email',
                    validatorText: 'Please enter your email',
                    controller: _email,
                    textInputType: TextInputType.emailAddress,
                  ),
                  FormTextField(
                    hintText: 'Phone number',
                    validatorText: 'Please enter your phone number',
                    controller: _phone,
                    textInputType: TextInputType.number,
                  ),
                  FormTextField(
                    hintText: 'Age',
                    validatorText: 'Please enter your age',
                    controller: _age,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: widget.mHeight * 0.01),
                  singupProcess
                      ? const CircularProgressIndicator()
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
                            onPressed: () async {
                              if (widget._formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.white,
                                    content: Text(
                                      "Passwords does not match",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                );

                                setState(() {
                                  singupProcess = true;
                                });
                                // await authentication.signup(
                                //   // email: _email.text.trim(),
                                //   name: _name.text.trim(),
                                //   phone: _phone.text.trim(),
                                //   dob: _age.text.trim(),
                                //   intrest: _intrest.text.trim(),
                                //   // password: _password.text.trim(),
                                //   // cpassword: _confirmPassword.text.trim(),
                                // );

                                setState(() {
                                  singupProcess = false;
                                });
                              }
                            },
                            child: Text(
                              widget.buttonText,
                              style: const TextStyle(fontSize: 20),
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
