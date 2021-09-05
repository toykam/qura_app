import 'package:flutter/material.dart';
import 'package:quran_app/backend/models/quran_chapter.dart';
import 'package:quran_app/utils/constants/colors.dart';

class ChapterDetail extends StatelessWidget {
  const ChapterDetail({Key? key, required this.quranChapter}) : super(key: key);
  final QuranChapter quranChapter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 257,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: primaryColor, offset: Offset(0,1), blurRadius: 10, spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.transparent
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image.asset('assets/images/read_quran_page_header_image.png', fit: BoxFit.cover)
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${quranChapter.nameSimple}", style: TextStyle(
                      color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 15,),
                  Text("${quranChapter.translatedName!.name}", style: TextStyle(
                      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400
                  ),),
                  SizedBox(height: 15,),
                  Container(
                    width: 200,
                    height: 1, color: Colors.white,
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${quranChapter.revelationPlace}", style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white
                      ),),
                      SizedBox(width: 5,) ,
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.white.withOpacity(.35),
                      ),
                      SizedBox(width: 5,) ,
                      Text("${quranChapter.versesCount} VERSES", style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white
                      ),),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Container(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/bismillah_image.png'))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
