import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/frontend/providers/app_provider.dart';
import 'package:quran_app/utils/constants/colors.dart';
import 'package:quran_app/utils/constants/routes.dart';
import 'package:quran_app/utils/route.dart';

import 'frontend/providers/chapter_list_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider(),),
        ChangeNotifierProvider(create: (context) => ChapterListProvider())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Quran App',
      theme: ThemeData(
        primarySwatch: primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme()
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: INITIAL_ROUTE,
      onGenerateRoute: (settings) => RouteGenerator.onGenerateRoute(settings),
      debugShowCheckedModeBanner: false,
    );
  }
}