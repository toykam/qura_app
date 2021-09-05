import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:quran_app/utils/constants/colors.dart';
import 'package:quran_app/utils/constants/routes.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 50,),
          Container(
            alignment: Alignment.center,
            child: Text("Quran App", style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: primaryColor
            ),),
          ),
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.center,
            child: Text("Learn Quran and\nRecite once everyday", style: TextStyle(
              fontSize: 18, color: lightPrimaryColor
            ), textAlign: TextAlign.center,),
          ),
          SizedBox(height: 30,),
          Expanded(
            child: Container(
              // height: 300,
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset('assets/images/splash_screen_image.png'),
                    top: 0, left: 0, right: 0, bottom: 30,
                  ),
                  Positioned(
                    bottom: 70, right: 80, left: 80,
                    child: FadeIn(
                      child: ElevatedButton(
                        child: Text("Get Started", style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600
                        ),),
                        onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(HOME_PAGE_SCREEN_ROUTE, (route) => false),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xFFF9B091)),
                            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ))

                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 50,),
        ]
      ),
    );
  }
}