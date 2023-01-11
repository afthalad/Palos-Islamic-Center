import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Setings'),
      ],
    );
  }
}

class SettingOptionWidget extends StatelessWidget {
  final String settingName;
  final IconData settingIcon;
  const SettingOptionWidget({
    Key? key,
    required this.settingName,
    required this.settingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: Icon(settingIcon),
        title: Text(settingName),
      ),
    );
  }
}
