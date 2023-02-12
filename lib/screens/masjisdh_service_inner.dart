import 'package:al_sahabah/const/const.dart';
import 'package:flutter/material.dart';

class MasjidhServiceInner extends StatefulWidget {
  const MasjidhServiceInner({super.key, required this.appBarTitle});

  final appBarTitle;
  @override
  State<MasjidhServiceInner> createState() => _MasjidhServiceInnerState();
}

class _MasjidhServiceInnerState extends State<MasjidhServiceInner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text(widget.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HtmlWidget(masjidhServicesText),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
