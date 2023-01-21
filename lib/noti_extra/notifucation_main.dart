import 'package:al_sahabah/service.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var memeber = notify();

  void initState() {
    super.initState();
    memeber.notifyInitialize();
  }

  // Pub get flutter_local_noitifcations it's commented in pubspec.yaml

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Local Notification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: memeber.showNotification(),
          child: const Text(
            'Demo',
          ),
        ),
      ),
    );
  }
}
