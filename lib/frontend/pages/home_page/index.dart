import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/frontend/pages/home_page/components/quran_chapter_list_by_hizbuh.dart';
import 'package:quran_app/frontend/pages/home_page/components/quran_chapter_list_juzu.dart';
import 'package:quran_app/frontend/pages/home_page/components/quran_chapter_list_surah.dart';
import 'package:quran_app/utils/constants/colors.dart';
import 'package:quran_app/utils/constants/routes.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 52,),
            Container(
              child: Row(
                children: [
                  Icon(IconlyLight.category, color: Color(0xFF8789A3),),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Text("Al Quran", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700, color: primaryColor
                    ),),
                  ),
                  Icon(IconlyLight.search, color: Color(0xFF8789A3),),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Asslamualaikum", style: TextStyle(
                    fontSize: 18, color: lightPrimaryColor, fontWeight: FontWeight.w400
                  ),),
                  SizedBox(height: 1,),
                  Text("Tanvir Ahassan", style: TextStyle(
                      fontSize: 24, color: Color(0xFF240F4F), fontWeight: FontWeight.w700
                  ),)
                ],
              ),
            ),
            SizedBox(height: 24,),
            Container(
              height: 131,
              width: MediaQuery.of(context).size.width,
              // decoration: ,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset('assets/images/last_read_image.png', fit: BoxFit.cover)
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/last_read_background.png'),
                          alignment: Alignment.bottomRight
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.menu_book_sharp, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("Last Read", style: TextStyle(
                                color: Colors.white, fontSize: 14
                              ),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("Al-Fatiah", style: TextStyle(
                              color: Colors.white, fontSize: 18
                          ),),
                          SizedBox(height: 5,),
                          Text("Ayah No: 1", style: TextStyle(
                              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 24,),
            Expanded(
              child: DefaultTabController(
                length: 4,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: primaryColor,
                      labelStyle: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600, color: lightPrimaryColor
                      ),
                      unselectedLabelColor: lightPrimaryColor,
                      labelColor: primaryColor,
                      tabs: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Text('Surah')),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Text('Juz')),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Text('Page')),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Text('Hizb')),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          QuranChapterListBySurah(),
                          QuranChapterListByJuzuh(),
                          QuranChapterListByHizbuh(),
                          Container(
                            height: 100,
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              itemCount: 114,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                                  leading: SizedBox(
                                    width: 50,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: Image.asset('assets/images/numbering_decorator.png'),
                                        ),
                                        Positioned.fill(
                                          child: Center(
                                            child: Text("${index + 1}"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  title: Text("Al-Fatiah", style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600
                                  ),),
                                  subtitle: Text('MECCAN - 7 VERSES', style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w400
                                  ),),
                                  trailing: Text("ةحتافلا", style: GoogleFonts.amiri(
                                      fontSize: 20, color: Color(0xFF863ED5)
                                  ),),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
