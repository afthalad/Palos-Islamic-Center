// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

// Color appBarColor = Color.fromARGB(255, 67, 25, 3);
Color appBarColor = const Color(0xFFCF962F);
Color sec = const Color(0xFF441A05);

var textFormDecoration = InputDecoration(
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: Color.fromARGB(115, 155, 153, 153)),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);

// MSalah Time
Color mSalah_time_container_color = appBarColor;
TextStyle mSalah_time_title_tstyle =
    const TextStyle(color: Colors.white, fontSize: 15);
TextStyle mSalah_time_subtitle_tstyle = const TextStyle(
  color: Colors.white,
  fontSize: 13,
);

// Feautres card
TextStyle features_title_tstyle = const TextStyle(
  fontSize: 12,
  color: Colors.black87,
);

// Event card
TextStyle event_date_time_tstyle = const TextStyle(
  fontSize: 15,
  color: Colors.white,
);
TextStyle event_name_tstyle = const TextStyle(
  fontSize: 30,
  color: Colors.white,
);

//Drawer
TextStyle drawer_title_tstyle = const TextStyle(color: Colors.white);

// Form Fields
InputDecoration form_field_input_decoration = const InputDecoration(
  contentPadding: EdgeInsets.all(15),
  border: OutlineInputBorder(),
);

// Prayer Time Table
String prayer_Time_table_islamic_month = 'Tue, 19 \nJumma';
TextStyle prayer_time_table_islamic_month_tstyle =
    const TextStyle(color: Colors.white, fontSize: 13);
TextStyle prayer_time_table_heading_tstyle =
    const TextStyle(color: Colors.white, fontSize: 13);

//Start drawer
// String start_drawer_username = 'Username';
String start_drawer_username = '';
String start_drawer_header_userimage = 'images/profile.jpg';

TextStyle start_drawer_username_tstyle = const TextStyle(
  fontSize: 20,
  color: Colors.white,
);

//End drawer
String end_drawer_heading = 'Notification & News';
String end_drawer_description =
    'Stay up to date with the latest notifications and news.';
String end_drawer_header_bgimage =
    'https://img.freepik.com/free-vector/ramadan-landscape-background-sunset_1048-1789.jpg?w=2000';
TextStyle end_drawer_heading_tstyle =
    const TextStyle(fontSize: 25, color: Colors.white);
TextStyle end_drawer_description_tstyle =
    const TextStyle(color: Colors.white54, fontSize: 12);

//Notification  Widget
String notification_widget_heading = 'Notification';
String notification_widget_description =
    'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets. ';
TextStyle notification_widget_heading_tstyle = const TextStyle(fontSize: 12);
TextStyle notification_widget_description_tstyle =
    const TextStyle(fontSize: 10);

//News Slide Widget
String news_slide_widget_title =
    'Palestine: 59 Palestinian journalists killed by Israel since 2000';
String news_slide_widget_subtitle = '10th Jan 2023';
String news_slide_widget_news_image =
    'https://muslimnews.co.uk/assets/Palestine-Israeliforces-attack-coffin-of-AlJazeera-journalist-Shireen-Abu-AKleh-E-Jerusalem-13-5-22-shot-dead-by-Israeli-forces-on-may11in-jenin-ph-Mustafa-alkharouf-AA-scaled-513x239.jpg';
TextStyle news_slide_widget_title_tstyle =
    const TextStyle(color: Colors.white, fontSize: 19);
TextStyle news_slide_widget_subtitle_tstyle =
    const TextStyle(color: Colors.white54);

//News List Tle Widget
String news_slide_widget_date = '4 days ago';
String news_list_tile_widget_title =
    'Hajj to return to pre-COVID numbers, SArabia officials say';
String news_slide_widget_description =
    'Islam’s annual Hajj pilgrimage will return to pre-pandemic levels this year after restrictions saw the annual religious.';
String news_list_tile_widget_news_image =
    'https://www.aljazeera.com/wp-content/uploads/2022/07/000_32DR44P-1.jpg?resize=770%2C513&quality=80';

TextStyle news_slide_widget_date_tstyle =
    const TextStyle(fontSize: 10, height: 2);
TextStyle news_list_tile_widget_title_tstyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);
TextStyle news_slide_widget_description_tstyle =
    const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 11);

//ASk the imam - Categories widget
String ask_the_imam_no_question_alert = 'There is no queestion';
TextStyle ask_the_imam_question_cat_name_tstyle = const TextStyle(
  fontWeight: FontWeight.bold,
);

// Ask the imam - Questions widget

TextStyle ask_the_imam_question_date_tstyle =
    const TextStyle(fontSize: 10.5, height: 3);
TextStyle ask_the_imam_question_tstyle =
    const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 13);

//1st Main Features Card
String m_features_card1_donationt_web_url = 'https://donorbox.org/pic22';

//2nd Main Features Card
String m_features_card2_facebook_web_url =
    'https://www.facebook.com/PalosIslamicCenter/';
String m_features_card2_youtube_web_url =
    'https://youtube.com/@picpalosislmiccenter8485';
String m_features_card2_instagram_web_url =
    'https://www.instagram.com/PalosIslamicCenter/';
String m_features_card2_zakath_calulator_web_url =
    'https://palosic.org/our-services/zakah-calculator/';

TextStyle aboutus_screen_heading_tstyle =
    const TextStyle(fontWeight: FontWeight.bold);

//Contact us screen
String contactus_screen_profile =
    'https://www.aclu.org/wp-content/uploads/2019/09/devon_chaffee_webedit-scaled.jpg';

TextStyle contactus_screen_profile_name_tstyle =
    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
TextStyle contactus_screen_profile_tstyle = const TextStyle(fontSize: 15);
TextStyle contactus_screen_profile_tstyle1 =
    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500);
TextStyle contactus_screen_profile_tstyl21 = const TextStyle(fontSize: 20);

// Events screen

TextStyle event_screen_date_tstyle =
    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
TextStyle event_screen_month_tstyle = const TextStyle(fontSize: 13);

// Live stream screen
String live_stream_screen_video_iframe = '''
    <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FPalosIslamicCenter%2Fposts%2Fpfbid02nKfMXJqutxgA32GQWVwg92dNqPyxoHNTcUTFEBLWsXf8ABsiX4fvDimYPyHq8eBml&show_text=true&width=500" width="500" height="372" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
    <!-- anything goes here -->
    ''';
// All news screen
String news_screen_title = 'Recent News';
String news_screen_subtitle = 'Stay up to date with the latest news and events';
TextStyle news_screen_title_tstyle = const TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

// News inner screen
String news_inner_screen_image =
    'https://muslimnews.co.uk/assets/Palestine-Israeliforces-attack-coffin-of-AlJazeera-journalist-Shireen-Abu-AKleh-E-Jerusalem-13-5-22-shot-dead-by-Israeli-forces-on-may11in-jenin-ph-Mustafa-alkharouf-AA-scaled-513x239.jpg';

TextStyle news_inner_screen_title_tstyle =
    const TextStyle(color: Colors.white, fontSize: 20);
TextStyle news_inner_screen_date_tstyle =
    const TextStyle(color: Colors.white54);

// Newsletter screen
String newsletter_screen_title = 'Subscribe Newsletter';
String newsletter_screen_subtitle = 'to unscubscribe please confirm your email';
String newsletter_screen_hintext = 'Email';
String newsletter_screen_validetext = 'Please enter email to subscribe';
String newsletter_screen_buttontext = 'Subscribe';
TextStyle newsletter_screen_title_tstyle =
    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
TextStyle newsletter_screen_buttontext_tstyle = const TextStyle(fontSize: 20);

// Unsubscribe Newsletter screen
String un_newsletter_screen_title = 'Confirm your email address';
String un_newsletter_screen_subtitle =
    'Subscribe to our updates right in your inbox.';

//Prayer timings screen
String prayer_timing_screen_bgimage = 'images/prayerTime.png';
