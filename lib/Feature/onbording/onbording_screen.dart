import 'package:dawak_24/Feature/onbording/widgets/doctor_image_and_text.dart';
import 'package:dawak_24/Feature/onbording/widgets/get_started_button.dart';
import 'package:dawak_24/Feature/onbording/widgets/logo_and_name.dart';
import 'package:dawak_24/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
          child: Column(
            children: [
              const LogoAndName(),
              SizedBox(height: 65.h),
              const DoctorImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 20),
                child: Column(
                  children: [
                    Text(
                      '- Upload the prescription or Picture of the medicine and get the medicine easily.\n- Find the best doctors in all specialties and \nconsult him about anything.',
                      style: TextStyles.font13GrayRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 35.h),
                    const GetStartedButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}