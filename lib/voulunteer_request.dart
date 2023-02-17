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

  volunteerRequest({
    required email,
    required name,
    required phone,
    required age,
  }) async {
    Dio dio = Dio();
    var response =
        await dio.post("http://52.90.175.175/api/volunteers/request", data: {
      "email": email,
      "name": name,
      "phone_number": phone,
      "age": age,
    });

    if (response.statusCode == 200 && response.data["error"] == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Successfully request sent",
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
      Navigator.pushNamed(context, "/home_screen");
    } else {
      if (response.data["message"] == "The email has already been taken.") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            content: Text(
              "The email has already been taken.",
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            content: Text(
              "Request send failure",
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Request send failure",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
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
          title: const Text("Volunteer request"),
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
                                setState(() {
                                  singupProcess = true;
                                });
                                await volunteerRequest(
                                  email: _email.text.trim(),
                                  name: _name.text.trim(),
                                  phone: _phone.text.trim(),
                                  age: _age.text.trim(),
                                );

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
