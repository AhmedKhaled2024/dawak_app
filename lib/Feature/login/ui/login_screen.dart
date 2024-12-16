import 'package:dawak_24/Feature/login/ui/widgets/dont_have_account_text.dart';
import 'package:dawak_24/Feature/login/ui/widgets/email_and_password.dart';
import 'package:dawak_24/Screens/forget_password_screen.dart';
import 'package:dawak_24/core/widgets/app_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../home/home_screen.dart';
import 'widgets/terms_and_conditions_text.dart';




class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
  

}



class _LoginScreenState extends State<LoginScreen> {
      final FirebaseAuth auth = FirebaseAuth.instance;
     final emailController=TextEditingController();
     final passwordController=TextEditingController();
    final formKey = GlobalKey<FormState>();

     void signUserIn()async{
   if(formKey.currentState!.validate()){

    await showDialog(context: context, builder: (constext){
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xff6149F7)),
          strokeWidth: 3.0,
           ),
      ); 
     }
   );
       try{
         await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: emailController.text,
           password: passwordController.text,
    );
     // ignore: use_build_context_synchronously
      Navigator.pop(context);
       } on FirebaseAuthException catch(e){
        //pop the loading circle
           // ignore: use_build_context_synchronously
           Navigator.pop(context);
          //wrong email
        if(e.code=='user-not-found'){
          wrongEmailMessage();
         // print('No user for that email');
       }
       //wrong passwrd
        if(e.code=='wrong-password'){
          wrongPasswordMessage();
         // print('Wrong password');
        }
       } 
     }
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //               return const HomeScreen();
      //               }));
   }
  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          
            child: SingleChildScrollView(
              
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyles.font24BurpleBold,
                    ),
                    verticalSpace(8),
                    Text(
                      'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                      style: TextStyles.font14GrayRegular,
                    ),
                    verticalSpace(36),
                    Column(
                      children: [
                        const EmailAndPassword(),
                        verticalSpace(24),
                        GestureDetector(
                     onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context){return const ForgetPasswordScreen();}),);
                     // Navigator.push(context,MaterialPageRoute(builder: (context){return const ForgetPasswordScreen();}),);
                         //context.pushNamed(Routes.forgetPasswordScreen);
                   },
                      child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyles.font13purpleRegular,
                            ),
                          ),
                         
                      ),
                        
                        verticalSpace(30),
                        AppTextButton(
                          
                          buttonText: "Login",
                          textStyle: TextStyles.font18WhiteSemiBold,
                          onPressed:() {
                            
Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return const HomeScreen();
  }));
                            
                // if (formKey.currentState!.validate()) {
                //   _signInWithEmailAndPassword();
                // }
              },

                          // signUserIn


                        ),
                        verticalSpace(16),
                        const  TermsAndConditionsText(),
                        verticalSpace(45),
                        const DontHaveAccountText(),
                     
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
       
      
    );
    
  }

  void _signInWithEmailAndPassword() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Navigate to home screen after successful sign in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      print('Sign in failed: $e');
      // Handle sign in failure
    }
  }




/// wrong email message popup
/// 
void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title:  Text(
            'Wrong Email',
            style: TextStyle(
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        );

      }
    );

   }

   /// wrong email message popup
/// 
void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title:  Text(
            'Incorrect Password',
            style: TextStyle(
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        );

      }
    );

   }
}




//--------------------------------------------//





// import 'package:dawak_24/Feature/login/ui/widgets/dont_have_account_text.dart';
// import 'package:dawak_24/Feature/login/ui/widgets/email_and_password.dart';
// import 'package:dawak_24/Screens/forget_password_screen.dart';
// import 'package:dawak_24/core/widgets/app_text_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../core/helpers/spacing.dart';
// import '../../../core/theming/styles.dart';
// import 'widgets/terms_and_conditions_text.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   void signUserIn() async {
//     if (formKey.currentState!.validate()) {
//       await showDialog(
//         context: context,
//         builder: (context) {
//           return const Center(
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Color(0xff6149F7)),
//               strokeWidth: 3.0,
//             ),
//           );
//         },
//       );
//       try {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text,
//           password: passwordController.text,
//         );
//         // ignore: use_build_context_synchronously
//         Navigator.pop(context);
//       } on FirebaseAuthException catch (e) {
//         // Pop the loading circle
//         // ignore: use_build_context_synchronously
//         Navigator.pop(context);
//         // Handle errors
//         if (e.code == 'user-not-found') {
//           wrongEmailMessage();
//         }
//         if (e.code == 'wrong-password') {
//           wrongPasswordMessage();
//         }
//       }
//     }
   
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
//           child: SingleChildScrollView(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Welcome Back',
//                     style: TextStyles.font24BurpleBold,
//                   ),
//                   verticalSpace(8),
//                   Text(
//                     'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
//                     style: TextStyles.font14GrayRegular,
//                   ),
//                   verticalSpace(36),
//                   Column(
//                     children: [
//                       TextFormField(
//                         controller: emailController,
//                         decoration:const  InputDecoration(
//                           labelText: 'Email',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
//                           if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                             return 'Please enter a valid email address';
//                           }
//                           return null;
//                         },
//                       ),
//                       verticalSpace(24),
//                       TextFormField(
//                         controller: passwordController,
//                         decoration:const  InputDecoration(
//                           labelText: 'Password',
//                           border: OutlineInputBorder(),
//                         ),
//                         obscureText: true,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           if (value.length < 6) {
//                             return 'Password must be at least 6 characters long';
//                           }
//                           return null;
//                         },
//                       ),
//                       verticalSpace(24),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const ForgetPasswordScreen()),
//                           );
//                         },
//                         child: Align(
//                           alignment: AlignmentDirectional.centerEnd,
//                           child: Text(
//                             'Forgot Password?',
//                             style: TextStyles.font13purpleRegular,
//                           ),
//                         ),
//                       ),
//                       verticalSpace(30),
//                       AppTextButton(
//                         buttonText: "Login",
//                         textStyle: TextStyles.font18WhiteSemiBold,
//                         onPressed: signUserIn,
//                       ),
//                       verticalSpace(16),
//                       const TermsAndConditionsText(),
//                       verticalSpace(45),
//                       const DontHaveAccountText(),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Wrong email message popup
//   void wrongEmailMessage() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const AlertDialog(
//           title: Text(
//             'Wrong Email',
//             style: TextStyle(
//               color: Colors.red,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         );
//       },
//     );
//   }

//   /// Wrong password message popup
//   void wrongPasswordMessage() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const AlertDialog(
//           title: Text(
//             'Incorrect Password',
//             style: TextStyle(
//               color: Colors.red,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         );
//       },
//     );
//   }
// }
