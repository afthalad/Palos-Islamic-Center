// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

var textFormDecoration = InputDecoration(
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: Color.fromARGB(115, 155, 153, 153)),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);

// MSalah Time
Color mSalah_time_container_color = const Color(0xFF66B35A);
TextStyle mSalah_time_title_tstyle =
    const TextStyle(color: Colors.white, fontSize: 15);
TextStyle mSalah_time_subtitle_tstyle = const TextStyle(
  color: Colors.white,
  fontSize: 12,
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
String start_drawer_username = 'Username';
String start_drawer_header_userimage =
    'https://thumbs.dreamstime.com/b/arabic-muslim-man-beard-smiling-36429753.jpg';

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
    const TextStyle(color: Colors.white, fontSize: 20);
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

TextStyle news_slide_widget_date_tstyle = const TextStyle(fontSize: 10);
TextStyle news_list_tile_widget_title_tstyle =
    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
TextStyle news_slide_widget_description_tstyle =
    const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 11);

//ASk the imam - Categories widget
String ask_the_imam_no_question_alert = 'There is no queestion';
TextStyle ask_the_imam_question_cat_name_tstyle = const TextStyle(
  fontWeight: FontWeight.bold,
);

// Ask the imam - Questions widget
String ask_the_imam_question_date = 'November 23.2018';
String ask_the_imam_question =
    'I read your answer about prayer whilst doing surgeryor afterwards.';
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

//About screen
String aboutus_screen_heading_1 = 'VISION STATEMENT';
String aboutus_screen_heading_2 = 'MISSION STATEMENT';
String aboutus_screen_heading_3 = 'HISTORY & TIMELINE';
String aboutus_screen_paragraph_1 =
    'Our vision is to be the leading mosque in the UnitedStates in providing Islamic guidance and services to thecommunity.\n';
String aboutus_screen_paragraph_2 =
    'The Mosque Foundation serves the spiritual, religiousand communal needs of area Muslims by meansof nurturing their faith, upholding their values, andfostering the well-being of the surrounding communitythrough worship, charity, education, outreach, and civicengagement.\n';
String aboutus_screen_paragraph_3 =
    "In 1954, a handful of Palestinian immigrants on Chicago'sfamous Southside established the Mosque Foundationof Chicago with the dream of one day building a structureto house the religious and cultural activities of theirgrowing young families. Today, that dream is reality asthe Mosque Foundation has become one of the busiestmosques in America, serving a community of more than50,000 Muslims.\n\nBuilt in 1981 on a few acres of swampy land in themiddle of mostly abandoned prairie in Bridgeview, theMosque Foundation began as a small structure with amaximum prayer hall capacity of 300 worshippers. Noone could foresee that the mosque's establishmentWould inspire a Muslim neighborhood of hundreds ofbeautiful new homes around the mosque, two full-timeIslamic schools at its perimeters, a Community Centerdown the road, and dozens of thriving businesses.\n\nThe community has steadily diversified to includeMuslims of many languages and experiences-all prayingside-by-side. Imams are active in education, counseling,spiritual guidance, and arbitration. Community memberswork with local and nation al Islamic, interfaith, and civicorganizations on numerous initiatives such as protectingAmerican civil liberties. empowerina Muslims.\n\nVery early on, Chicago area Muslims rented varioussites around the south side of Chicago to holdcongregational Eid Prayers and celebrations. Fridayprayers were sometimes held in storefront propertiesof Muslim-owned businesses. As the population ofthe Muslim community grew, the need was realized topurchase property. So, in 1963, a church located at 6500S. Steward Avenue was purchased and converted into aprayer hall and school for the community of more thana hundred Arab Muslim families living in the southwestside of Chicago at the time. Arabic language and religionclasses were held in the Steward property, as well asvarious community functions. Several years later, thebuilding was sold to purchase a storefront property at79th and Clyde Avenue.\n\nThe Clyde property was sold shortly thereafter, with theproceeds reserved to purchase land in Bridgeview, wherethe Mosque currently stands. Designs of the Mosquewere presented in 1977, and construction began inNovember 1978. Three years later, in 1981, the doorsto the Mosque Foundation were officially opened, andthe first congregational prayers were held. All five dailyobligatory prayers and Friday congregational prayerswere offered from the start, as well as nightly Taraweehprayers during the month of Ramadan. Quran recitationclasses, Hadith lectures, and regular monthly meetingswere established to serve the spiritual and social needsof the community.\n\nIt is impossible to overestimate the impact the MosqueFoundation has had on the community, particularly theyouth. While a youth group was formed very early on tocater to the needs of the younger generation, a separatebuilding designated for the youth was purchasedand opened in 1996. We have witnessed young menwho seemed destined to a life of crime and violencebecome outstandina citizens who are now students andwho seemed destined to a life of crime and violencebecome outstanding citizens who are now students andprofessionals in a variety of fields, due largely in part tothose dedicated youth mentors.\n\nDuring the 1990's, the Mosque Foundation communityexpanded greater than anyone could have predicted.The growing needs and increasing numbers required theMosque Foundation to expand its original facility, whichwas completed in 1998. Yet, even as the new prayer areanearly doubled in size, two Friday Congregational Prayersand two evening Ramadan Taraweeh Prayers were stillneeded to serve the large community. Among the manyfunctions of a mosque is to serve the needy, and itsvarious roles in serving the community continues to grow.For example, in 2005 the Mosque Foundation openedaCommunity Food Pantry to help combat hunger for lowincome families in the local community.\n\nThis is an unavoidably brief history of the MosqueFoundation, but it's important to know the services thisinstitution provides in a general sense that cannot bedated through:\n\n⚫ Providing an environment in which men and womenmay worship with peace of mind and a sense of home.\n\n⚫ Thousands of young people learning the morals andethics of their religion in the weekend schools.\n\n⚫ Hundreds of families receiving counseling for avariety of personal concerns, marriage matters, disputeresolutions, and bereavement and funeral senvices.\n\n⚫ Providing many social services for the underprivileged,free health screenings, and support for needy families.\n\n⚫ Reaching out and establishing strong relations withleaders and congregations of other faith communities-Catholic, Protestant, and Jewish. The MosqueFoundation is commito the noble enterprise cmutual understanding";
TextStyle aboutus_screen_heading_tstyle =
    const TextStyle(fontWeight: FontWeight.bold);

//Contact us screen
String contactus_screen_profile =
    'https://www.aclu.org/wp-content/uploads/2019/09/devon_chaffee_webedit-scaled.jpg';
String contactus_screen_profile_name = 'Oussuma Jammal';
String contactus_screen_profile_post = 'President and Chairman of the board';
String contactus_screen_profile_email = 'ojammal@mosquefoundation.org';
String contactus_screen_profile_phone = '(708)430-567';
TextStyle contactus_screen_profile_name_tstyle =
    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold);
TextStyle contactus_screen_profile_tstyle = const TextStyle(fontSize: 12);

// Events screen
String event_screen_date = '20th';
String event_screen_month = 'NOV';
String event_screen_time = 'Wed 06.00pm - 07.50pm';
String event_screen_event_name = 'Sister Class';
TextStyle event_screen_date_tstyle =
    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
TextStyle event_screen_month_tstyle = const TextStyle(fontSize: 13);

// Home screen
String homescreen_slideshow_image1 =
    'https://images.unsplash.com/photo-1597734187998-e1931acfe2ed?ixlib=rb-4ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFzamlkfGVufDB8fDB8fA%3D%3D&w=1000&q=80';
String homescreen_slideshow_image2 =
    'https://images.unsplash.com/photo-1519818187420-8e49de7adeef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80';

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
String news_inner_screen_title =
    'Palestine: 55 Palestinian journalists killed by Israel since 2000';
String news_inner_screen_date = '10th Jan 2023';
String news_inner_screen_news =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in vulputate nisl. Nam ut feugiat dui. Sed tempor neque sit amet bibendum finibus. Duis id efficitur ante. Etiam mauris tortor, malesuada ac eros at, dictum interdum erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam faucibus vel tortor egestas lacinia. Quisque sed mollis lacus. Morbi luctus, nisl accumsan ornare tincidunt, ex lectus luctus ligula, sed tincidunt turpis nunc eu tellus. Aenean non metus ut diam aliquam sollicitudin. Integer tincidunt lorem purus, sed feugiat nisi tempor et. Suspendisse in magna sed justo consequat placerat. Etiam tellus dui, pharetra nec libero sit amet, commodo aliquam massa. Aliquam erat volutpat.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in vulputate nisl. Nam ut feugiat dui. Sed tempor neque sit amet bibendum finibus. Duis id efficitur ante. Etiam mauris tortor, malesuada ac eros at, dictum interdum erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam faucibus vel tortor egestas lacinia. Quisque sed mollis lacus. Morbi luctus, nisl accumsan ornare tincidunt, ex lectus luctus ligula, sed tincidunt turpis nunc eu tellus. Aenean non metus ut diam aliquam sollicitudin. Integer tincidunt lorem purus, sed feugiat nisi tempor et. Suspendisse in magna sed justo consequat placerat. Etiam tellus dui, pharetra nec libero sit amet, commodo aliquam massa. Aliquam erat volutpat.\n\n";
TextStyle news_inner_screen_title_tstyle =
    const TextStyle(color: Colors.white, fontSize: 20);
TextStyle news_inner_screen_date_tstyle =
    const TextStyle(color: Colors.white54);

// Newsletter screen
String newsletter_screen_title = 'Subscribe Newsletter';
String newsletter_screen_subtitle =
    'Subscribe to our updates right in your inbox.';
String newsletter_screen_hintext = 'Email';
String newsletter_screen_validetext = 'Please enter email to subscribe';
String newsletter_screen_buttontext = 'Subscribe';
TextStyle newsletter_screen_title_tstyle =
    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
TextStyle newsletter_screen_buttontext_tstyle = const TextStyle(fontSize: 20);

//Prayer timings screen
String prayer_timing_screen_bgimage =
    'https://static.vecteezy.com/system/resources/previews/006/998/428/original/islamic-design-for-background-ramadan-kareem-banner-mosque-silhouette-design-illustration-ramadan-kareem-s-design-is-similar-to-greetings-invitations-templates-or-backgrounds-free-vector.jpg';
