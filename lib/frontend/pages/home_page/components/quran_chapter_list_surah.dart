import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/frontend/providers/chapter_list_provider.dart';
import 'package:quran_app/frontend/widgets/loading_widget.dart';
import 'package:quran_app/utils/constants/colors.dart';
import 'package:quran_app/utils/constants/routes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:quran_app/backend/models/quran_chapter.dart';

class QuranChapterListBySurah extends StatelessWidget {
  const QuranChapterListBySurah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChapterListProvider>(
      builder: (context, value, child) {
        if (value.loading) {
          return Container(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 3),
              itemCount: 5,
              itemBuilder: (context, index) {
                return LoadingWidget(
                  child: ListTile(
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
                ),
                );
              },
            ),
          );
        }
        if (value.errorOccurred) {
          return Container(
            child: Column(
              children: [
                Center(
                  child: Text("${value.message}"),
                ),
                TextButton(onPressed: () => value.initialize(), child: Text("Retry"))
              ],
            ),
          );
        }
        return Container(
          height: 100,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 3),
            itemCount: value.chapters.length,
            itemBuilder: (context, index) {
              QuranChapter chapter = value.chapters[index];
              return FadeInUp(
                child: ListTile(
                  onTap: () => Navigator.of(context).pushNamed(READ_QURAN_SCREEN_ROUTE, arguments: chapter),
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
                            child: Text("${chapter.id}"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text("${chapter.nameSimple}", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600
                  ),),
                  subtitle: Text('${chapter.revelationPlace} - ${chapter.versesCount} VERSES', style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400
                  ),),
                  trailing: Text("${chapter.nameArabic}", style: GoogleFonts.amiri(
                      fontSize: 20, color: Color(0xFF863ED5)
                  ),),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
