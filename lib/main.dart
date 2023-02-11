import 'package:al_sahabah/screens/events.dart';
import 'package:al_sahabah/screens/homescreen.dart';
import 'package:al_sahabah/screens/live_stream.dart';
import 'package:al_sahabah/screens/location_prayer_time.dart';
import 'package:al_sahabah/screens/masjidh_services.dart';
import 'package:al_sahabah/screens/news.dart';
import 'package:al_sahabah/screens/prayer_time.dart';
import 'package:al_sahabah/screens/qibla/qibla_screen.dart';
import 'package:al_sahabah/screens/sing_in.dart';
import 'package:al_sahabah/screens/splashs.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:just_audio/just_audio.dart';
import 'firebase_options.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter_notification_channel/flutter_notification_channel.dart';
// import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  String? token = await FirebaseMessaging.instance.getToken();
  print("Token:$token");
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    criticalAlert: false,
    provisional: false,
  );
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidNotificationChannel BeepNotificationChannelSettings =
      AndroidNotificationChannel(
    'Beep',
    'Beep Sound',
    description: 'Play Beep Sound for Notification',
    playSound: true,
    sound: RawResourceAndroidNotificationSound('beep'),
  );
  const AndroidNotificationChannel AzanNotificationChannelSettings =
      AndroidNotificationChannel(
    'Azan',
    'Azan Sound',
    description: 'Play Azan Sound for Notification',
    playSound: true,
    sound: RawResourceAndroidNotificationSound('azan'),
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(BeepNotificationChannelSettings);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(AzanNotificationChannelSettings);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('Message asdasdsadaas: ${message.data}');
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  print('User granted permission: ${settings.authorizationStatus}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const SplashScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/signin_screen': (context) => const SigninScreen(),
        '/masjidh_services_screen': (context) => const MasjidhServicesScreen(),
        '/events_screen': (context) => const EventsScreen(),
        '/prayer_time_screen': (context) => const PrayerTimingsScreen(),
        '/qibla_screen': (context) => QiblaScreen(),
        '/live_stream_screen': (context) => const LiveStreamScreen(),
        '/news_screen': (context) => const NewsScreen(),
        '/location_prayer_time_screen': (context) =>
            const LocationPrayerTimingsScreen(),
      },
    );
  }
}
