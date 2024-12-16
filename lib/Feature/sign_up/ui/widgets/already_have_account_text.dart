import 'package:dawak_24/Feature/login/ui/login_screen.dart';
import 'package:dawak_24/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Login',
            style: TextStyles.font18purpleSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //context.pushReplacementNamed(Routes.loginScreen);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const LoginScreen();
                
        }));
              },
          ),
        ],
      ),
    );
  }
}