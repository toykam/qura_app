import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/utils/constants/routes.dart';

class QuranChapterListByHizbuh extends StatelessWidget {
  const QuranChapterListByHizbuh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 3),
        itemCount: 114,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Navigator.of(context).pushNamed(READ_QURAN_SCREEN_ROUTE),
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
    );
  }
}
