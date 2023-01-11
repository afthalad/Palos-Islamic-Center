import 'package:flutter/material.dart';

class DrawerPagesScreen extends StatefulWidget {
  final String appBarTitle;
  final Widget pageWidget;
  const DrawerPagesScreen({
    super.key,
    required this.pageWidget,
    required this.appBarTitle,
  });

  @override
  State<DrawerPagesScreen> createState() => _DrawerPagesScreenState();
}

class _DrawerPagesScreenState extends State<DrawerPagesScreen> {
  final _formKey = GlobalKey<FormState>();

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
