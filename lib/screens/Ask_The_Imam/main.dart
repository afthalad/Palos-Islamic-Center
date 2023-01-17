import 'package:al_sahabah/screens/Ask_The_Imam/ask_question.dart';
import 'package:al_sahabah/screens/Ask_The_Imam/faq_inner.dart';
import 'package:al_sahabah/widgets/widgets.dart';
import 'package:flutter/material.dart';

//Ask the imam - main screen
class AskTheImamScreen extends StatelessWidget {
  const AskTheImamScreen(
      {Key? key,
      required List<Tab> tabs,
      required TabController? tabController})
      : _tabs = tabs,
        _tabController = tabController,
        super(key: key);

  final List<Tab> _tabs;
  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: const Color(0xFF66B35A),
          centerTitle: true,
          title: Text('Ask the imam'),
          bottom: TabBar(
            indicatorColor: const Color(0xFF0D50A3).withOpacity(0.3),
            tabs: _tabs,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TabBarView(
            controller: _tabController,
            children: [
              GridView.count(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
                children: <Widget>[
                  AskTheImamCategories(
                    catName: 'Faiq Of Family',
                    catDescription:
                        "Fiqh of the family is an Islamic law branch that deals with marriage, divorce, and family issues. It covers rights, responsibilities and procedures based on Quran and Hadith.",
                    imageUrl:
                        "https://www.islamicfinder.org/news/preview-title/post673_title_20220201_094909.png/673",
                    noQuesntions: '1',
                  ),
                  AskTheImamCategories(
                    catName: "Hadeeth & it's science",
                    catDescription:
                        "Delve into the study of Hadith and its significance in preserving the teachings of Prophet Muhammad in Islamic tradition",
                    imageUrl:
                        "https://media.islamicity.org/wp-content/uploads/2021/03/best-books-of-hadith.jpg",
                    noQuesntions: '6',
                  ),
                  AskTheImamCategories(
                    catName: "Itikaaf",
                    catDescription:
                        "I'tikaf is a spiritual practice in Islam where a person retreats to a mosque for a certain number of days for intense worship and devotion to God. It's typically done during the last ten days of Ramadan but can also be done at other times of the year. The goal is to increase closeness to God and purify the soul.",
                    imageUrl:
                        "https://www.isra.org.au/wp-content/uploads/2021/04/2.png",
                    noQuesntions: '2',
                  ),
                  AskTheImamCategories(
                    catName: 'Knowladge & propat',
                    catDescription:
                        "Disseminating and promoting knowledge in accordance with Islamic teachings and principles",
                    imageUrl:
                        "https://cms-static.wehaacdn.com/documentmedia-com/images/The-Illusion-of-Knowledge---DOCUMENT-Strategy.1570.jpg",
                    noQuesntions: '1',
                  ),
                  AskTheImamCategories(
                    catName: "Mosque Issues",
                    catDescription:
                        "Addressing common questions and concerns related to the management and maintenance of Mosques",
                    imageUrl:
                        "https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1vc3F1ZXxlbnwwfHwwfHw%3D&w=1000&q=80",
                    noQuesntions: '6',
                  ),
                  AskTheImamCategories(
                    catName: "Prayer",
                    catDescription:
                        "Prayer is an essential ritual in Islam, performed five times a day at specific times. It includes recitation of Quran, bowing, prostrating and sitting. The purpose of prayer is to maintain a connection with God and seek forgiveness and guidance. It is performed facing Mecca.",
                    imageUrl:
                        "https://laffaz.com/wp-content/uploads/2018/03/The-5-Times-of-Namaz-Muslim-Prayer-with-Meaning.jpg",
                    noQuesntions: '2',
                  ),
                  AskTheImamCategories(
                    catName: "Other",
                    catDescription: "Other questions and answer",
                    imageUrl:
                        "https://www.ucf.edu/news/files/2021/04/Ramadan-Celebration.jpg",
                    noQuesntions: '0',
                  ),
                ],
              ),
              ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Questions(
                      appBarTitle: 'My Questions',
                      pageWidget: FAQInnerScreen());
                },
              ),
              ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Questions(
                    appBarTitle: 'FAQ',
                    pageWidget: FAQInnerScreen(),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AskTheQuestionScreen()));
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.note_alt_rounded),
        ),
      ),
    );
  }
}
