import 'package:flutter/material.dart';

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
                    children: const [
                      Text(
                        '20th',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'NOV',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                title: Text('Sister Class'),
                subtitle: Text('Wed 06.00pm - 07.50pm'),
                trailing: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage('images/duhr.png'),
                  ),
                ),
              );
            }));
  }
}
