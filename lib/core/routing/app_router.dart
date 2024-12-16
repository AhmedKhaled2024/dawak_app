import 'package:dawak_24/Feature/home/home_screen.dart';
import 'package:dawak_24/Feature/login/ui/login_screen.dart';
import 'package:dawak_24/Feature/onbording/onbording_screen.dart';
import 'package:dawak_24/Feature/sign_up/ui/sign_up_screen.dart';
import 'package:dawak_24/Screens/forget_password_screen.dart';
import 'package:dawak_24/Screens/splash_screens.dart';
import 'package:dawak_24/Screens/start_screen.dart';
import 'package:dawak_24/core/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  
  Route generateRoute(RouteSettings settings) {
    
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    //final arguments = settings.arguments;

    switch (settings.name) {
      
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) =>  const SplashScreen(),
          settings: settings,
        );
      case Routes.startScreen:
        return MaterialPageRoute(
          builder: (_) =>  const StartScreen(),
          settings: settings,
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
          //settings: settings,
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const  LoginScreen(),
         // settings: settings,
          
        );
        case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
          settings: settings,
          
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
          settings: settings,
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) =>  HomeScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
              
            ),
          ),
        );
        
    }
  }
   
}