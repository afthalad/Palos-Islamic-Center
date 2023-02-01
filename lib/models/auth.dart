// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart'; // import 'package:http/http.dart' as http;

class Auth {
  final BuildContext context;
  Auth(this.context);
  Dio dio = Dio();

  // SIGN IN
  signIn(email, password) async {
    var response = await dio.post("http://52.90.175.175/api/login",
        data: {"email": email, "password": password});

    final prefs = await SharedPreferences.getInstance();

    if (response.statusCode == 200 && response.data['error'] == 0) {
      var token = response.data["data"]["token"];
      var email = response.data["data"]["user"]["email"];
      var name = response.data["data"]["user"]["name"];
      prefs.setString("token", token);
      prefs.setString("email", email);
      prefs.setString("name", name);
      prefs.setBool("loggedin", true);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Logged in sucessfull",
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
            "Incorrect password / username",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }

  //SIGN OUT
  void signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("loggedin", false);
    await prefs.clear();

    Navigator.pushNamed(context, "/home_screen");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        content: Text(
          "Successfully logged out",
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }

  //SIGN UP
  signup({
    required email,
    required name,
    required phone,
    required dob,
    required intrest,
    required password,
    required cpassword,
  }) async {
    var response = await dio.post("http://52.90.175.175/api/register", data: {
      "email": email,
      "name": name,
      "phone": phone,
      "notification": true,
      "dob": dob,
      "interests": intrest,
      "password": password,
      "password_confirmation": cpassword,
      // "image": Null
    });

    if (response.statusCode == 200 && response.data["error"] == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Successfully registered",
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
            "signup failure",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }
}
