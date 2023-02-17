import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SlideBanner extends StatelessWidget {
  const SlideBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ImageSlideshow(
        width: double.infinity,
        height: double.infinity,
        children: [
          Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.colorBurn),
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1601191362988-ac6ebec629c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bW9zcXVlfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ABOUT US',
                        style: TextStyle(
                          height: 1,
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Islamic community ',
                        style: TextStyle(
                          letterSpacing: -1,
                          height: 1.5,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'building and outreach.',
                        style: TextStyle(
                          letterSpacing: -1.5,
                          height: 1,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: 40,
                left: 10,
              )
            ],
          ),
          Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.colorBurn),
                    image: NetworkImage(
                        'https://zahrafoundation.ca/wp-content/uploads/2021/02/4-1024x536.jpg'),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DONATE US',
                        style: TextStyle(
                            height: 1,
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Be a part of building',
                        style: TextStyle(
                          letterSpacing: -1,
                          height: 1.5,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'bridges of peace',
                        style: TextStyle(
                          letterSpacing: -1.5,
                          height: 1,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: 40,
                left: 10,
              )
            ],
          ),
        ],
        autoPlayInterval: 3000,
        isLoop: true,
      ),
    );
  }
}
