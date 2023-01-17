import 'package:flutter/material.dart';

//Contace Us Details
class ContaceusDetailsScreen extends StatelessWidget {
  const ContaceusDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: const Text("Contact us"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 0.5),
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.aclu.org/wp-content/uploads/2019/09/devon_chaffee_webedit-scaled.jpg'),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Oussuma Jammal',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                    Text(
                      'President and Chairman of the board',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('ojammal@mosquefoundation.org',
                        style: TextStyle(fontSize: 12)),
                    Text('(708)430-567', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
