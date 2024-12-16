import 'package:dawak_24/Feature/home/home_screen.dart';
import 'package:dawak_24/Feature/home/ui/home_tesst.dart';
import 'package:dawak_24/Feature/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:dawak_24/Feature/sign_up/ui/widgets/already_have_account_text.dart';
import 'package:dawak_24/Feature/sign_up/ui/widgets/sign_up_form.dart';
import 'package:dawak_24/core/helpers/spacing.dart';
import 'package:dawak_24/core/theming/styles.dart';
import 'package:dawak_24/core/widgets/app_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
final emailController=TextEditingController();
final passwordController=TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _SignupScreenState extends State<SignupScreen> {
  

  late Map<String, dynamic> data;
  @override
  void  initState(){
    super.initState();
    data = {
      "firstName": "",
      "phomeNumber" : "",
      "email"    : "",
      "password" : "",
      "confirmPassword" : "",
    };
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24BurpleBold,
                ),
                verticalSpace(7),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(26),
                Column(
                  children: [
                    const SignupForm(),
                    
                    verticalSpace(20),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: TextStyles.font18WhiteSemiBold,
                       onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                     }));
                // if (formKey.currentState!.validate()) {
                //   _registerWithEmailAndPassword();
                // }
              },
                       //{
                      //   FirebaseAuth.instance.createUserWithEmailAndPassword(
                      //      email: _emailTextController.text,
                      //     password: _passwordTextController.text
                      //    ).then((value){
                      //     print('create account');
                      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      //      return const HomeScreen();
                      //       }));
                      //    }).onError((error,stackTrace){
                      //      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //        content: Text(error.toString()),
                      //        duration: const Duration(seconds: 3),
                      //      ),
                      //      );
                      //      print("Error ${error.toString()}");
                           
                      //    });
                      
                      // },
                    ),
                    verticalSpace(16),
                     const  TermsAndConditionsText(),
                    verticalSpace(25),
                    const AlreadyHaveAccountText(),
                   
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _registerWithEmailAndPassword() async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Navigate to home screen after successful sign up
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>const  HomeScreen()),
      );
    } catch (e) {
      print('Sign up failed: $e');
      // Handle sign up failure
    }
  }
}