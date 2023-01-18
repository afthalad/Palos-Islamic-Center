import 'package:al_sahabah/screens/location_prayer_time.dart';
import 'package:al_sahabah/screens/prayer_timing.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:flutter/material.dart';

//Setting Page Screen
class SettingPageScreen extends StatefulWidget {
  const SettingPageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingPageScreen> createState() => _SettingPageScreenState();
}

class _SettingPageScreenState extends State<SettingPageScreen> {
  bool _switchValue = true;
  bool _switchValue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SettingOptionWidget(
              settingName: 'Athan',
              settingSubtitle: 'Set a reminder for Athan time',
              settingIcon: Icons.mosque,
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black12,
              ),
              pageWidget: Column(
                children: [
                  ListTile(
                    title: Text('Athan Reminder'),
                    subtitle: Text("Customize your athan reminder settings"),
                  ),
                  AthanSettings(
                    name: 'FAJR',
                    dropdownValue: 'No reminder',
                    dropDownOptions: [
                      'No reminder',
                      'Beeb',
                      'Allahu Akbar Allahu Akbar',
                    ],
                  ),
                  AthanSettings(
                    name: 'DUHR',
                    dropdownValue: 'No reminder',
                    dropDownOptions: [
                      'No reminder',
                      'Beeb',
                      'Allahu Akbar Allahu Akbar',
                    ],
                  ),
                  AthanSettings(
                    name: 'ASR',
                    dropdownValue: 'No reminder',
                    dropDownOptions: [
                      'No reminder',
                      'Beeb',
                      'Allahu Akbar Allahu Akbar',
                    ],
                  ),
                  AthanSettings(
                    name: 'MAGRIB',
                    dropdownValue: 'No reminder',
                    dropDownOptions: [
                      'No reminder',
                      'Beeb',
                      'Allahu Akbar Allahu Akbar',
                    ],
                  ),
                  AthanSettings(
                    name: 'ISHA',
                    dropdownValue: 'No reminder',
                    dropDownOptions: [
                      'No reminder',
                      'Beeb',
                      'Allahu Akbar Allahu Akbar',
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        elevation: 0,
                        backgroundColor: const Color(0xFF0D50A3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(-10)),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Save settings',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SettingOptionWidget(
              settingName: 'Iqamah',
              settingSubtitle: 'Reminder at or before iqamah time',
              settingIcon: Icons.handshake,
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black12,
              ),
              pageWidget: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'Enter minutes to set the reminder before lqamah time.Give yourself enough time to make it to the Masjid . Remind before lqamah time (in minutes)'),
                  ),
                  Column(
                    children: [
                      IqamahSettings(
                        name: 'FAJR',
                        dropdownValue: 'No reminder',
                        dropDownOptions: [
                          'No reminder',
                          'Beeb',
                          'Allahu Akbar Allahu Akbar',
                        ],
                      ),
                      IqamahSettings(
                        name: 'DUHR',
                        dropdownValue: 'No reminder',
                        dropDownOptions: [
                          'No reminder',
                          'Beeb',
                          'Allahu Akbar Allahu Akbar',
                        ],
                      ),
                      IqamahSettings(
                        name: 'ASR',
                        dropdownValue: 'No reminder',
                        dropDownOptions: [
                          'No reminder',
                          'Beeb',
                          'Allahu Akbar Allahu Akbar',
                        ],
                      ),
                      IqamahSettings(
                        name: 'MAGRIB',
                        dropdownValue: 'No reminder',
                        dropDownOptions: [
                          'No reminder',
                          'Beeb',
                          'Allahu Akbar Allahu Akbar',
                        ],
                      ),
                      IqamahSettings(
                        name: 'ISHA',
                        dropdownValue: 'No reminder',
                        dropDownOptions: [
                          'No reminder',
                          'Beeb',
                          'Allahu Akbar Allahu Akbar',
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            elevation: 0,
                            backgroundColor: const Color(0xFF0D50A3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(-10)),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Save settings',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SettingOptionWidget(
              settingName: 'Notifications',
              settingSubtitle: 'Enable or Disable notifications',
              settingIcon: Icons.notifications,
              trailingWidget: Switch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
