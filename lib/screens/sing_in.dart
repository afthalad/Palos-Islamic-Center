import 'package:al_sahabah/models/auth.dart';
import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/widgets/sing_in_slide_banner.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool singInProcess = false;
  bool passWordVisible = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Auth authentication = Auth(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SlideBanner(),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                    children: [
                      const Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Nurturing faith and upholding values",
                            style: TextStyle(
                              letterSpacing: 0.3,
                              fontSize: 18,
                              height: 1.5,
                            ),
                          )),
                      const Padding(
                        padding: EdgeInsets.only(left: 1),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '“Whosoever intercedes for a good cause will have the reward thereof. Al-Quran 4:85”',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 2),
                            child: TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: ((value) {}),
                              validator: ((value) {
                                if (value!.isEmpty) {
                                  return "Please enter your full name";
                                }
                                return null;
                              }),
                              decoration: textFormDecoration.copyWith(
                                  hintText: "Email"),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 2),
                              child: TextFormField(
                                controller: _password,
                                obscureText: passWordVisible,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter your password';
                                  }
                                  return null;
                                },
                                decoration: textFormDecoration.copyWith(
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                      color: Colors.black38,
                                      onPressed: () {
                                        setState(() {
                                          passWordVisible = !passWordVisible;
                                        });
                                      },
                                      icon: Icon(
                                        passWordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      )),
                                ),
                              )),
                          const SizedBox(height: 10),
                          singInProcess == true
                              ? const CircularProgressIndicator()
                              : GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      singInProcess = !singInProcess;
                                    });
                                    await authentication.signIn(
                                      _email.text,
                                      _password.text,
                                    );
                                    setState(() {
                                      singInProcess = !singInProcess;
                                    });
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: const Color(0xFF0D50A3),
                                    ),
                                    // ignore: sort_child_properties_last
                                    child: const Center(
                                      child: Text(
                                        'Get Start',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    height: 50,
                                    width: double.infinity,
                                  ),
                                ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
