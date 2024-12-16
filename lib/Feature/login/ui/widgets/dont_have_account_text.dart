//import 'package:flutter/gestures.dart';
import 'package:dawak_24/Feature/sign_up/ui/sign_up_screen.dart';
import 'package:dawak_24/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
           Text('Don\'t have an account?',style:TextStyles.font13DarkBlueRegular,),
           horizontalSpace(5),
           GestureDetector(
            onTap: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const SignupScreen();}));  
            },
            child: Text('Sign Up',style: TextStyles.font18purpleSemiBold,)),

      ]
    );
  }
}



// RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: 'Don\'t have an account?',
//             style: TextStyles.font13DarkBlueRegular,
//           ),
//           TextSpan(
//             text: ' Sign Up',
//             style: TextStyles.font13BurpleSemiBold,
           
             
//           ),
//         ],
//       ),
//     );