import 'package:flutter/material.dart';

class MasjidhServicesScreen extends StatelessWidget {
  const MasjidhServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF66B35A),
        centerTitle: true,
        title: const Text('Majish Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'SERVICES OVERVIEW',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Service is among the highest callings of a human being.As such, the core mission of the Mosque Foundation is toprovide valuable services to its large community. Theseservices are meant to foster a strong sense of familyand community, and provide spiritual solace and sacredspace in a fast-paced and sometimes overwhelmingworld. More than 10,000 people benefit from the MosqueFoundation's services on a regular basis. We feel honoredto be of service to our oommunity. For more informationon each service, please click the service on the leftnavigation menu\n",
              ),
              Text(
                '1. PRAYER SERVICES5 TIMES A DAY',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "One of the core services the Mosque Foundation offersis Prayer Services. The Mosque Foundation is a full timeMosque that conducts 5 daily prayer services 7 days aweek all year long. Additionally, the Mosque Foundationholds 2 Friday prayers due to space and parking lotslimitations. The timing for each prayer is posted on theright side of the home page (main page).\n\nFive separate times a day (dawn, noon, late afternoon,dusk, and evening), our Mosque is available forworshippers to come and perfom the sacred andbeautiful act of worship in congregation.\n",
              ),
              Text(
                '2. MARRIAGE SERVICES',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "We offer pre-marriage advice to couples about tojoin each other in the holy bond and commitment ofmatrimony. We perform the formal marriage service, inconjunction with State requirements and documentation.\n",
              ),
              Text(
                '4. ASK THE IMAM',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Often times we are confronted with a situation in whichthe right choice is not clear or we simply are not awareof the best ethical decision to make. The MosqueFoundation offers people opportunities to ask our Imamsabout these situations and how Islami's sacred law adresses them.\n",
              ),
              Text(
                '5. ARBITRATION',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Whenever disagreements arise (whether they involve business matters or other aspects of life), it is useful to seek an impartial arbiter to help solve the problem. The Mosque Foundation offers objedisputes and preserve relations between the disputantstive arbitration .\n",
              ),
              Text(
                '6. FUNERAL SERVICESS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "When the inevitability of death comes to our loved ones,the details and pressures of funerals can be taxing. TheMosque Foundation offers grieving families funeralservices, including washing of the body. proper wrappingwith cloth, funeral sermons, and prayer services.\n",
              ),
              Text(
                '7. FOOD PANTRY',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Thousands of needy families each year receive food fromour Food Pantry. Among the most praised kinds of charityis the feeding of the poor. Whenever we relieve the stressof the needy, our wealth never decreases and our rank inthe eyes of God increases.\n",
              ),
              Text(
                '8. WEEKEND SCHOOL',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "The Mosque Foundation for the last 25 years hasprovided weekend education for our youth to learntimeless wisdom and gain valuable knowledge that willhelp achieve a firm understanding of their faith and theethics and morals it provides them. Over the years, tensof thousands of young boys and girls have learned at theMosque Foundation al-Siddiq weekend school. (Call forthe Mosque Foundation for details.)\n",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
