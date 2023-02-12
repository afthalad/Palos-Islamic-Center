import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPost {
  BuildContext? context;
  SettingPost(this.context);
  Dio dio = Dio();

  enableNotificationSettingPost(notification) async {
    Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    var fcmToken = await prefs.getString('fcmToken');
    print(notification);
    var response =
        await dio.post("http://52.90.175.175/api/save-app-settigs", data: {
      "token": fcmToken,
      "enable_notification": notification ? 1 : 0,
      "device_type": Platform.operatingSystem == "android" ? "android" : "ios",
    });

    if (response.statusCode == 200 && response.data['error'] == 0) {
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Something went wrong",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }

// Iqama Setting POST
  iqamaSettingsPost(
    fajrReminder,
    duhrReminder,
    asrReminder,
    magribReminder,
    ishaReminder,
    fajrTime,
    duhrTime,
    asrTime,
    magribTime,
    ishaTime,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    var fcmToken = await prefs.getString('fcmToken');

    var response =
        await dio.post("http://52.90.175.175/api/save-app-settigs", data: {
      "token": fcmToken,
      "app_settings": {
        "before_athan": {
          "fajir": {"sound": fajrReminder, "time": fajrTime},
          "dhuhar": {"sound": duhrReminder, "time": duhrTime},
          "asr": {"sound": asrReminder, "time": asrTime},
          "magrib": {"sound": magribReminder, "time": magribTime},
          "isha": {"sound": ishaReminder, "time": ishaTime}
        }
      },
      "device_type": Platform.operatingSystem == "android" ? "android" : "ios"
    });
    // var response =
    //     await dio.post("http://52.90.175.175/api/save-app-settigs", data: {
    //   "token": fcmToken,
    //   "app_settings": {
    //     "iqamah": {
    //       "fajir": {"sound": fajrReminder, "time": fajrTime},
    //       "dhuhar": {"sound": duhrReminder, "time": duhrTime},
    //       "asr": {"sound": asrReminder, "time": asrTime},
    //       "magrib": {"sound": magribReminder, "time": magribTime},
    //       "isha": {"sound": ishaReminder, "time": ishaTime}
    //     }
    //   },
    //   "device_type": Platform.operatingSystem == "android" ? "android" : "ios"
    // });

    if (response.statusCode == 200 && response.data['error'] == 0) {
      print("success");
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Setting saved sucessfully",
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Something went wrong",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }

  settingsPost(
    fajrReminder,
    duhrReminder,
    asrReminder,
    magribReminder,
    ishaReminder,
  ) async {
    Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    var fcmToken = await prefs.getString('fcmToken');

    var response = await dio.post(
      "http://52.90.175.175/api/save-app-settigs",
      data: {
        "token": fcmToken,
        "app_settings": {
          "adhan": {
            "fajir": fajrReminder,
            "dhuhar": duhrReminder,
            "asr": asrReminder,
            "magrib": magribReminder,
            "isha": ishaReminder,
          }
        },
        "device_type": Platform.operatingSystem == "android" ? "android" : "ios"
      },
    );
    print(response);

    if (response.statusCode == 200 && response.data['error'] == 0) {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Setting saved sucessfully",
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          content: Text(
            "Something went wrong",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }
}
