import 'package:flutter/material.dart';

// Ask the imam - FAQ inner screen
class FAQInnerScreen extends StatelessWidget {
  const FAQInnerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Colors.black12),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Zohaib Ahmed',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'November 2022.18',
                    style: TextStyle(fontSize: 12),
                  ),
                  Divider(),
                  Text(
                      'I read your answer about prayer whilst doing surgery or afterwards. I work as a doctor and the day is very short in Canada during the winter, Maghrib comes at 5 p.m. Hence the time between the prayers is very short and I do not know how the surgeon can do his work when this time is very short. Hence think it is better to make the prayers up afterward. What is your opinion on that?'),
                ],
              ),
            ),
          ),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Colors.black12),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pretium quam sed enim aliquam suscipit. Nulla hendrerit, neque nec sollicitudin tristique, diam ipsum hendrerit lorem, eleifend dictum leo nulla a magna. \n\nNunc dignissim, libero quis auctor fermentum, arcu sapien sollicitudin orci, vel feugiat est dui ut felis. Sed tempor sodales nunc eu malesuada. Nam tellus nisi, congue eget ex at, pellentesque lacinia est. Nulla pellentesque eu justo consectetur congue. Fusce elit lectus, pretium nec bibendum in, mollis in magna. Fusce auctor lobortis ante non porttitor. Etiam venenatis arcu mi, id malesuada dui tempus eu. \n\nAliquam ornare ultrices risus at finibus. Ut ac eros vitae dui vestibulum fermentum. Aliquam ante tortor, cursus et euismod et, gravida et justo.\n\nVivamus nec arcu tortor. Nam eu facilisis tellus, eget congue ligula. Sed enim metus, laoreet in aliquam sit amet, molestie sit amet diam. Nulla facilisi. Praesent non neque lacus. Aliquam erat volutpat. Nulla euismod ornare fermentum.\n\nSed efficitur ligula nulla, eu malesuada turpis pulvinar ut. Duis a suscipit orci. Proin tempus mattis elit. Phasellus sit amet tellus rhoncus, aliquet neque eu, euismod elit. Aliquam aliquet sem turpis. Phasellus at justo metus. Nulla eget magna ante. Nam massa nunc, finibus tincidunt nisl euismod, viverra fringilla justo. Sed laoreet tortor quis facilisis vestibulum. Suspendisse efficitur felis eget felis hendrerit, vulputate scelerisque enim lobortis. Quisque vehicula egestas libero, et tempor eros tincidunt faucibus. Proin bibendum dolor nec aliquet blandit."),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
