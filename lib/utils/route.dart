

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quran_app/backend/models/quran_chapter.dart';
import 'package:quran_app/frontend/pages/home_page/index.dart';
import 'package:quran_app/frontend/pages/read_quran_page/index.dart';
import 'package:quran_app/frontend/pages/splash_screen.dart';
import 'package:quran_app/utils/constants/routes.dart';

class RouteGenerator {


  static Route onGenerateRoute(RouteSettings settings) {
    String name = settings.name!;
    dynamic arguments = settings.arguments;
    print(arguments);

    switch (name) {
      case INITIAL_ROUTE:
        return MaterialPageRoute(builder: (context) => SplashScreenPage());
      case HOME_PAGE_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (context) => HomePageScreen(),);
      case READ_QURAN_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (context) => ReadQuranPage(quranChapter: arguments as QuranChapter,),);

      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}