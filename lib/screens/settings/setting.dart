import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/settings/athan_setting.dart';
import 'package:al_sahabah/screens/settings/iqamah_setting.dart';
import 'package:al_sahabah/services/setting_post.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Setting Page Screen
class SettingPageScreen extends StatefulWidget {
  const SettingPageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingPageScreen> createState() => _SettingPageScreenState();
}

class _SettingPageScreenState extends State<SettingPageScreen> {
  var notificatioIsEnabled;
  var _switchValue = true;

  saveEnableNotificationSetting(switchValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('notication', "");
    await prefs.setString('notication', switchValue ? "1" : "0");
    // print(prefs.getString('notication'));
  }

  getEnableNotificationSetting(switchValue) async {
    final prefs = await SharedPreferences.getInstance();
    var isEnabled = await prefs.getString('notication');
    setState(() {
      isEnabled == "0" ? _switchValue = false : _switchValue = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getEnableNotificationSetting(_switchValue);
  }

  @override
  Widget build(BuildContext context) {
    SettingPost settingPost = SettingPost(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
            child: ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AthanSettingPageScreen()),
              ),
              leading: Icon(
                Icons.mosque,
                color: sec,
                size: 35,
              ),
              title: const Text('Athan'),
              subtitle: const Text(
                'Reminder at athan time',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black12,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
            child: ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BeforeAthanSettingPageScreen()),
              ),
              leading: Icon(
                Icons.handshake,
                color: sec,
                size: 35,
              ),
              title: const Text('Before Athan'),
              subtitle: const Text(
                'Reminder at or before Athan time',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black12,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
            child: ListTile(
              leading: Icon(
                Icons.notifications_active,
                color: sec,
                size: 35,
              ),
              title: const Text('Notifications'),
              subtitle: const Text(
                'Enable or Disable notifications',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              trailing: Switch(
                value: _switchValue,
                onChanged: (value) async {
                  setState(() {
                    _switchValue = value;
                  });
                  await saveEnableNotificationSetting(_switchValue);
                  // print(_switchValue);
                  await settingPost.enableNotificationSettingPost(_switchValue);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
