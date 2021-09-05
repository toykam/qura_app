import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/backend/models/quran_chapter.dart';
import 'package:quran_app/frontend/pages/read_quran_page/components/chapter_detail.dart';
import 'package:quran_app/frontend/pages/read_quran_page/components/chapter_verse.dart';
import 'package:quran_app/frontend/providers/read_chapter_provider.dart';
import 'package:quran_app/frontend/widgets/loading_widget.dart';
import 'package:quran_app/utils/constants/colors.dart';

class ReadQuranPage extends StatelessWidget {
  ReadQuranPage({Key? key, required this.quranChapter}) : super(key: key);
  ScrollController listScrollController = ScrollController(
    keepScrollOffset: true, initialScrollOffset: 1.0
  );
  final QuranChapter quranChapter;



  @override
  Widget build(BuildContext context) {
    // final chapter = ModalRoute.of(context)!.settings.arguments as QuranChapter;
    // print(chapter);
    return Scaffold(
      body: SafeArea(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ReadChapterProvider(quranChapter),)
          ],
          child: Consumer<ReadChapterProvider>(
            builder: (context, value, child) {
              QuranChapter chapter = value.chapter;
              print(value.allVersePlayerState);
              return Stack(
                children: [       
                  Positioned.fill(
                    top: 60,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        controller: value.scrollController,
                        // physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [

                            ChapterDetail(quranChapter: quranChapter),

                            // SizedBox(height: 24,),
                            ListView.builder(
                              shrinkWrap: true, primary: false,
                              padding: EdgeInsets.all(0),
                              itemBuilder: (context, index) {
                                return value.loading ?
                                LoadingWidget(child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.fromLTRB(0,0,0,15),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Color(0xFFBBC4CE).withOpacity(.35))
                                      )
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF863ED5).withOpacity(.05),
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 15,
                                              child: Text("${index + 1}", style: TextStyle(
                                                  fontSize: 18, color: Colors.white
                                              ),),
                                              backgroundColor: MaterialColor(0xFF863ED5, colorMap).withOpacity(.5),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Icon(IconlyLight.send, color: Color(0xFF863ED5),),
                                                  SizedBox(width: 10,),
                                                  Icon(IconlyLight.play, color: Color(0xFF863ED5),),
                                                  SizedBox(width: 10,),
                                                  Icon(IconlyLight.bookmark, color: Color(0xFF863ED5),),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 30,),
                                      Container(
                                        child: Text('َﻦﻳِمَلٰعْلا ِّبَر ِهَّلِل ُدْمَحْلا', style: GoogleFonts.amiri(
                                            fontSize: 18, fontWeight: FontWeight.w400
                                        ), textAlign: TextAlign.end,),
                                        alignment: Alignment.centerRight,
                                      ),
                                      SizedBox(height: 15,),
                                      Container(
                                        child:Text('[All] praise is [due] to Allah, Lord of the worlds -', style: GoogleFonts.poppins(
                                            fontSize: 16, fontWeight: FontWeight.w400
                                        ), textAlign: TextAlign.end,),
                                        alignment: Alignment.centerRight,
                                      ),
                                    ],
                                  ),
                                )) :
                                ChapterVerseWidget(chapterVerse: value.verses[index]);
                              },
                              itemCount: value.loading ? 1 : value.verses.length,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0, left: 0, right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  child: Icon(IconlyBold.arrowLeft, color: Color(0xFF8789A3),),
                                  onTap: () => Navigator.pop(context),
                                ),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: Text("${chapter.nameSimple}", style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w700, color: primaryColor
                                  ),),
                                ),
                                Icon(IconlyLight.search, color: Color(0xFF8789A3),),
                              ],
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                    right: 0, left: 0, bottom: 0,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      child: Row(
                        children: [
                          Container(
                            child: Stack(
                              children: [
                                if ([PlayState.Buffering, PlayState.Loading].contains(value.allVersePlayerState))
                                  ...[
                                    Container(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ],

                                Container(
                                  child: Center(
                                    child: InkWell(
                                        onTap: () async {
                                          value.playAllVerse();
                                        },
                                        child: Icon(value.allVersePlaying ? Icons.pause_circle_filled_rounded : IconlyBold.play, size: 40, color: primaryColor,)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: Container(
                              child: DropdownButtonFormField(
                                value: 1,
                                onChanged: (index) {
                                  print(index);
                                },
                                items: [
                                  ...List.generate(10, (index) => DropdownMenuItem(
                                    child: Text('Abdullah $index'), value: index,
                                  ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
