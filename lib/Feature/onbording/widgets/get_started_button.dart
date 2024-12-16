import 'package:dawak_24/Screens/splash_screens.dart';
import 'package:dawak_24/core/theming/colors.dart';
import 'package:dawak_24/core/theming/styles.dart';
import 'package:flutter/material.dart';


class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //context.pushNamed(Routes.splashScreen);
        //Navigator.pushNamed(context, Routes.splashScreen);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const SplashScreen();}));  
      },
      style: ButtonStyle(
        backgroundColor:  WidgetStateProperty.all(ColorsManager.mainPurple),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize:  WidgetStateProperty.all(
          const Size(double.infinity, 55),
        ),
        shape:  WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteMedium,
      ),
    );
  }
}