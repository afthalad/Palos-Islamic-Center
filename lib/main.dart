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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:native_notify/native_notify.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // NativeNotify.initialize(2537, 'co4HxKVDmJz9LZ37E0OfBc', null, null);
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
