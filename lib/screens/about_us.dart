import 'package:flutter/material.dart';

//About us page widget
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: Text("About us"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'VISION STATEMENT',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Our vision is to be the leading mosque in the UnitedStates in providing Islamic guidance and services to thecommunity.\n',
              ),
              Text(
                'MISSION STATEMENT',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'The Mosque Foundation serves the spiritual, religiousand communal needs of area Muslims by meansof nurturing their faith, upholding their values, andfostering the well-being of the surrounding communitythrough worship, charity, education, outreach, and civicengagement.\n',
              ),
              Text(
                'HISTORY & TIMELINE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  "In 1954, a handful of Palestinian immigrants on Chicago'sfamous Southside established the Mosque Foundationof Chicago with the dream of one day building a structureto house the religious and cultural activities of theirgrowing young families. Today, that dream is reality asthe Mosque Foundation has become one of the busiestmosques in America, serving a community of more than50,000 Muslims.\n\nBuilt in 1981 on a few acres of swampy land in themiddle of mostly abandoned prairie in Bridgeview, theMosque Foundation began as a small structure with amaximum prayer hall capacity of 300 worshippers. Noone could foresee that the mosque's establishmentWould inspire a Muslim neighborhood of hundreds ofbeautiful new homes around the mosque, two full-timeIslamic schools at its perimeters, a Community Centerdown the road, and dozens of thriving businesses.\n\nThe community has steadily diversified to includeMuslims of many languages and experiences-all prayingside-by-side. Imams are active in education, counseling,spiritual guidance, and arbitration. Community memberswork with local and nation al Islamic, interfaith, and civicorganizations on numerous initiatives such as protectingAmerican civil liberties. empowerina Muslims.\n\nVery early on, Chicago area Muslims rented varioussites around the south side of Chicago to holdcongregational Eid Prayers and celebrations. Fridayprayers were sometimes held in storefront propertiesof Muslim-owned businesses. As the population ofthe Muslim community grew, the need was realized topurchase property. So, in 1963, a church located at 6500S. Steward Avenue was purchased and converted into aprayer hall and school for the community of more thana hundred Arab Muslim families living in the southwestside of Chicago at the time. Arabic language and religionclasses were held in the Steward property, as well asvarious community functions. Several years later, thebuilding was sold to purchase a storefront property at79th and Clyde Avenue.\n\nThe Clyde property was sold shortly thereafter, with theproceeds reserved to purchase land in Bridgeview, wherethe Mosque currently stands. Designs of the Mosquewere presented in 1977, and construction began inNovember 1978. Three years later, in 1981, the doorsto the Mosque Foundation were officially opened, andthe first congregational prayers were held. All five dailyobligatory prayers and Friday congregational prayerswere offered from the start, as well as nightly Taraweehprayers during the month of Ramadan. Quran recitationclasses, Hadith lectures, and regular monthly meetingswere established to serve the spiritual and social needsof the community.\n\nIt is impossible to overestimate the impact the MosqueFoundation has had on the community, particularly theyouth. While a youth group was formed very early on tocater to the needs of the younger generation, a separatebuilding designated for the youth was purchasedand opened in 1996. We have witnessed young menwho seemed destined to a life of crime and violencebecome outstandina citizens who are now students andwho seemed destined to a life of crime and violencebecome outstanding citizens who are now students andprofessionals in a variety of fields, due largely in part tothose dedicated youth mentors.\n\nDuring the 1990's, the Mosque Foundation communityexpanded greater than anyone could have predicted.The growing needs and increasing numbers required theMosque Foundation to expand its original facility, whichwas completed in 1998. Yet, even as the new prayer areanearly doubled in size, two Friday Congregational Prayersand two evening Ramadan Taraweeh Prayers were stillneeded to serve the large community. Among the manyfunctions of a mosque is to serve the needy, and itsvarious roles in serving the community continues to grow.For example, in 2005 the Mosque Foundation openedaCommunity Food Pantry to help combat hunger for lowincome families in the local community.\n\nThis is an unavoidably brief history of the MosqueFoundation, but it's important to know the services thisinstitution provides in a general sense that cannot bedated through:\n\n⚫ Providing an environment in which men and womenmay worship with peace of mind and a sense of home.\n\n⚫ Thousands of young people learning the morals andethics of their religion in the weekend schools.\n\n⚫ Hundreds of families receiving counseling for avariety of personal concerns, marriage matters, disputeresolutions, and bereavement and funeral senvices.\n\n⚫ Providing many social services for the underprivileged,free health screenings, and support for needy families.\n\n⚫ Reaching out and establishing strong relations withleaders and congregations of other faith communities-Catholic, Protestant, and Jewish. The MosqueFoundation is commito the noble enterprise cmutual understanding"),
            ],
          ),
        ),
      ),
    );
  }
}
