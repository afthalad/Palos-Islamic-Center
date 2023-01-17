import 'package:al_sahabah/const/const.dart';
import 'package:flutter/material.dart';

// Events screen
class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: const Color(0xFF66B35A),
          centerTitle: true,
          title: const Text('Events'),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.1,
                      image: AssetImage('images/icon-calendar.png'),
                    ),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children:  [
                      Text(
                        event_screen_date,
                        style: event_screen_date_tstyle
                      ),
                      Text(
                        event_screen_month,
                        style: event_screen_month_tstyle,
                      ),
                    ],
                  ),
                ),
                title: Text(event_screen_event_name),
                subtitle: Text(event_screen_time),
                trailing: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: AssetImage('images/duhr.png'),
                  ),
                ),
              );
            }));
  }
}
