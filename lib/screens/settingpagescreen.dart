import 'package:flutter/material.dart';

class SettingPagesScreen extends StatefulWidget {
  final String appBarTitle;
  final Widget pageWidget;
  const SettingPagesScreen({
    super.key,
    required this.pageWidget,
    required this.appBarTitle,
  });

  @override
  State<SettingPagesScreen> createState() => _DrawerPagesScreenState();
}

class _DrawerPagesScreenState extends State<SettingPagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: Text(widget.appBarTitle),
      ),
      body: widget.pageWidget,
    );
  }
}
