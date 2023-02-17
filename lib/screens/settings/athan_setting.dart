// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/services/setting_post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Iqama Setting Page Screen
class AthanSettingPageScreen extends StatefulWidget {
  const AthanSettingPageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AthanSettingPageScreen> createState() => _AthanSettingPageScreenState();
}

class _AthanSettingPageScreenState extends State<AthanSettingPageScreen> {
  bool isProcessed = false;
  var fajradhandropdownValue = 'No reminder';
  var duhradhandropdownValue = 'No reminder';
  var asradhandropdownValue = 'No reminder';
  var magribadhandropdownValue = 'No reminder';
  var ishaadhandropdownValue = 'No reminder';
  var drop = [
    'No reminder',
    'Beeb',
    'Allahu Akbar Allahu Akbar',
  ];

  saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fajrAdhan', fajradhandropdownValue);
    await prefs.setString('duhrAdhan', duhradhandropdownValue);
    await prefs.setString('asrAdhan', asradhandropdownValue);
    await prefs.setString('magribAdhan', magribadhandropdownValue);
    await prefs.setString('ishaAdhan', ishaadhandropdownValue);
  }

  void getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fajradhandropdownValue = prefs.getString('fajrAdhan') ?? 'No reminder';
      duhradhandropdownValue = prefs.getString('duhrAdhan') ?? 'No reminder';
      asradhandropdownValue = prefs.getString('asrAdhan') ?? 'No reminder';
      magribadhandropdownValue =
          prefs.getString('magribAdhan') ?? 'No reminder';
      ishaadhandropdownValue = prefs.getString('ishaAdhan') ?? 'No reminder';
    });
  }

  @override
  void initState() {
    super.initState();
    getSettings();
  }

  @override
  Widget build(BuildContext context) {
    SettingPost settingPost = SettingPost(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: const Text("Athan Settings"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "Customize your Athan reminders here. Set prayer time notifications, select the sound, and choose the reminder minutes with just a few taps"),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 61,
                  child: Text("FAJR"),
                ),
                const SizedBox(
                  width: 30,
                ),
                DropdownButton<String>(
                  value: fajradhandropdownValue,
                  onChanged: (newValue) async {
                    setState(() {
                      fajradhandropdownValue = newValue!;
                    });
                  },
                  items: drop.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 61,
                  child: Text("DUHR"),
                ),
                const SizedBox(
                  width: 30,
                ),
                DropdownButton<String>(
                  value: duhradhandropdownValue,
                  onChanged: (newValue) async {
                    setState(() {
                      duhradhandropdownValue = newValue!;
                    });
                  },
                  items: drop.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 61,
                  child: Text("ASR"),
                ),
                const SizedBox(
                  width: 30,
                ),
                DropdownButton<String>(
                  value: asradhandropdownValue,
                  onChanged: (newValue) async {
                    setState(() {
                      asradhandropdownValue = newValue!;
                    });
                  },
                  items: drop.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 61,
                  child: Text("MAGRIB"),
                ),
                const SizedBox(
                  width: 30,
                ),
                DropdownButton<String>(
                  value: magribadhandropdownValue,
                  onChanged: (newValue) async {
                    setState(() {
                      magribadhandropdownValue = newValue!;
                    });
                  },
                  items: drop.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 61,
                  child: Text("ISHA"),
                ),
                const SizedBox(
                  width: 30,
                ),
                DropdownButton<String>(
                  value: ishaadhandropdownValue,
                  onChanged: (newValue) async {
                    setState(() {
                      ishaadhandropdownValue = newValue!;
                    });
                  },
                  items: drop.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          isProcessed
              ? const CircularProgressIndicator()
              : Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      elevation: 0,
                      backgroundColor: sec,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(-10)),
                    ),
                    onPressed: () async {
                      setState(() {
                        isProcessed = true;
                      });
                      await saveSettings();
                      await settingPost.settingsPost(
                          fajradhandropdownValue,
                          duhradhandropdownValue,
                          asradhandropdownValue,
                          magribadhandropdownValue,
                          ishaadhandropdownValue);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.white,
                          content: Text(
                            "Settings saved successfully",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      );
                      setState(() {
                        isProcessed = false;
                      });
                    },
                    child: const Text(
                      'Save settings',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
