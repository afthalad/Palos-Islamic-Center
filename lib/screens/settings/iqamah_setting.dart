import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/services/setting_post.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Iqama Setting Page Screen
class BeforeAthanSettingPageScreen extends StatefulWidget {
  const BeforeAthanSettingPageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BeforeAthanSettingPageScreen> createState() =>
      _BeforeAthanSettingPageScreenState();
}

class _BeforeAthanSettingPageScreenState
    extends State<BeforeAthanSettingPageScreen> {
  bool _switchValue = true;
  bool _switchValue2 = false;
  bool isProcessed = false;

  var fajrdropdownValue = 'No reminder';
  var duhrdropdownValue = 'No reminder';
  var asrdropdownValue = 'No reminder';
  var magribdropdownValue = 'No reminder';
  var ishadropdownValue = 'No reminder';

  var drop = [
    'No reminder',
    'Beeb',
  ];

  final fajrTextController = TextEditingController();
  final duhrTextController = TextEditingController();
  final asrTextController = TextEditingController();
  final magribTextController = TextEditingController();
  final ishaTextController = TextEditingController();

  iqamahSaveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fajrIqama', fajrdropdownValue);
    await prefs.setString('duhrIqama', duhrdropdownValue);
    await prefs.setString('asrIqama', asrdropdownValue);
    await prefs.setString('magribIqama', magribdropdownValue);
    await prefs.setString('ishaIqama', ishadropdownValue);
    await prefs.setString('fajrTextFormField', fajrTextController.text);
    await prefs.setString('duhrTextFormField', duhrTextController.text);
    await prefs.setString('asrTextFormField', asrTextController.text);
    await prefs.setString('magribTextFormField', magribTextController.text);
    await prefs.setString('ishaTextFormField', ishaTextController.text);
  }

  iqamahGetSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fajrdropdownValue = prefs.getString('fajrIqama') ?? 'No reminder';
      duhrdropdownValue = prefs.getString('duhrIqama') ?? 'No reminder';
      asrdropdownValue = prefs.getString('asrIqama') ?? 'No reminder';
      magribdropdownValue = prefs.getString('magribIqama') ?? 'No reminder';
      ishadropdownValue = prefs.getString('ishaIqama') ?? 'No reminder';
      fajrTextController.text = prefs.getString('fajrTextFormField') ?? '0';
      duhrTextController.text = prefs.getString('duhrTextFormField') ?? '0';
      asrTextController.text = prefs.getString('asrTextFormField') ?? '0';
      magribTextController.text = prefs.getString('magribTextFormField') ?? '0';
      ishaTextController.text = prefs.getString('ishaTextFormField') ?? '0';
    });
  }

  @override
  void initState() {
    super.initState();
    iqamahGetSettings();
  }

  @override
  Widget build(BuildContext context) {
    SettingPost settingPost = SettingPost(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: const Text("Before Athan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Customize your Iqama reminders here. Set prayer time notifications, select the sound, and choose the reminder minutes with just a few taps"),
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
                    value: fajrdropdownValue,
                    onChanged: (newValue) async {
                      setState(() {
                        fajrdropdownValue = newValue!;
                      });
                    },
                    items: drop.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                        key: Key(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.122,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: fajrTextController,
                        decoration: InputDecoration(
                          hintText: "0",
                        ),
                      ),
                    ),
                  )
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
                    value: duhrdropdownValue,
                    onChanged: (newValue) async {
                      setState(() {
                        duhrdropdownValue = newValue!;
                      });
                    },
                    items: drop.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                        key: Key(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.122,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: duhrTextController,
                        decoration: InputDecoration(
                          hintText: "0",
                        ),
                      ),
                    ),
                  )
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
                    value: asrdropdownValue,
                    onChanged: (newValue) async {
                      setState(() {
                        asrdropdownValue = newValue!;
                      });
                    },
                    items: drop.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                        key: Key(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.122,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: asrTextController,
                        decoration: InputDecoration(
                          hintText: "0",
                        ),
                      ),
                    ),
                  )
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
                    value: magribdropdownValue,
                    onChanged: (newValue) async {
                      setState(() {
                        magribdropdownValue = newValue!;
                      });
                    },
                    items: drop.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                        key: Key(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.122,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: magribTextController,
                        decoration: InputDecoration(
                          hintText: "0",
                        ),
                      ),
                    ),
                  )
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
                    value: ishadropdownValue,
                    onChanged: (newValue) async {
                      setState(() {
                        ishadropdownValue = newValue!;
                      });
                    },
                    items: drop.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                        key: Key(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.122,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: ishaTextController,
                        decoration: InputDecoration(
                          hintText: "0",
                        ),
                      ),
                    ),
                  )
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
                        await iqamahSaveSettings();
                        await settingPost.iqamaSettingsPost(
                          fajrdropdownValue,
                          duhrdropdownValue,
                          asrdropdownValue,
                          magribdropdownValue,
                          ishadropdownValue,
                          fajrTextController.text,
                          duhrTextController.text,
                          asrTextController.text,
                          magribTextController.text,
                          ishaTextController.text,
                        );
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
      ),
    );
  }
}
