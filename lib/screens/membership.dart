import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/services/authenticaition.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//Signup page Screen
class MembershipScreen extends StatefulWidget {
  final String pageTitle;
  final String pageSubTitle;
  final String buttonText;
  MembershipScreen(
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
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _fullAddress = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  List<String> membershipType = [
    "Individual",
    "Family",
  ];
  String? membershipTypeValue;
  bool singupProcess = false;
  bool showFamilyMemberFields = false;
  List<Widget> demos = [];
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
          title: const Text("Membership"),
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
                      hintText: 'First name',
                      validatorText: 'Please enter your first name',
                      controller: _firstName,
                      textInputType: TextInputType.name),
                  FormTextField(
                      hintText: 'Last name',
                      validatorText: 'Please enter your last name',
                      controller: _lastName,
                      textInputType: TextInputType.name),
                  FormTextField(
                      hintText: 'Phone number',
                      validatorText: 'Please enter your Phone number',
                      controller: _phone,
                      textInputType: TextInputType.phone),
                  FormTextField(
                    hintText: 'Email',
                    validatorText: 'Please enter your email',
                    controller: _email,
                    textInputType: TextInputType.emailAddress,
                  ),
                  FormTextField(
                    hintText: 'Full address ',
                    validatorText: 'Please enter your address',
                    controller: _fullAddress,
                    textInputType: TextInputType.text,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Membership ",
                          style: TextStyle(fontSize: 17),
                        ),
                        DropdownButton<String>(
                          hint: Text('Membership type'),
                          value: membershipTypeValue,
                          items: membershipType.map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              membershipTypeValue = value!;
                              if (membershipTypeValue == "Family") {
                                showFamilyMemberFields = true;
                              } else {
                                showFamilyMemberFields = false;
                              }
                            });
                          },
                        ),
                        Visibility(
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              setState(() {
                                var memberIndex = demos.length + 1;
                                demos.add(Card(
                                  shape: RoundedRectangleBorder(
                                    //<-- SEE HERE
                                    side: BorderSide(
                                      color: appBarColor.withOpacity(0.5),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Family Member $memberIndex",
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  demos.removeAt(
                                                      memberIndex); // subtract 1 from memberIndex to get the correct index of the demo to be removed
                                                });
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                      FormTextField(
                                          hintText: 'First name',
                                          validatorText:
                                              'Please enter your first name',
                                          controller: _firstName,
                                          textInputType: TextInputType.name),
                                      FormTextField(
                                          hintText: 'Last name',
                                          validatorText:
                                              'Please enter your last name',
                                          controller: _lastName,
                                          textInputType: TextInputType.name),
                                      FormTextField(
                                        hintText: 'DOB',
                                        validatorText: 'Please enter your dob',
                                        controller: _dob,
                                        textInputType:
                                            TextInputType.emailAddress,
                                      ),
                                      FormTextField(
                                        hintText: 'Email',
                                        validatorText:
                                            'Please enter your email',
                                        controller: _email,
                                        textInputType: TextInputType.text,
                                      ),
                                    ],
                                  ),
                                ));
                              });
                            },
                            // child: Text(
                            //   "Add family members",
                            //   style: const TextStyle(fontSize: 20),
                            // ),
                          ),
                          visible: showFamilyMemberFields,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    child: Column(
                      children: demos,
                    ),
                    visible: showFamilyMemberFields,
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
