import 'package:dawak_24/Feature/home/home_screen.dart';
import 'package:dawak_24/Feature/login/ui/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
             } 
                else {
                return const LoginScreen();
              }
            }));
  }
}





////------------

// if(snapshot.connectionState == ConnectionState.active){
          //   return const HomeScreen();
            
          // }
          // else

          // return Center(
          //   child: CircularProgressIndicator(),
          // );

