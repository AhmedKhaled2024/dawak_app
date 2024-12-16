import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dawak_24/Feature/onbording/onbording_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: AnimatedSplashScreen(
          duration: 1000,
          splash:const Image(image: AssetImage('assets/images/Logo_white.png',),fit: BoxFit.fill),
            
           nextScreen: const OnboardingScreen(),
            splashTransition: SplashTransition.fadeTransition,
          // pageTransitionType: PageTransitionType.scale,
            backgroundColor: const Color(0xff9B33FF),

        ),


          
        ),
      
    );
  }
}


