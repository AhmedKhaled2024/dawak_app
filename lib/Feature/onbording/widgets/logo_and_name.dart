import 'package:dawak_24/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoAndName extends StatelessWidget {
  const LogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svg/logo.svg',height:30 ,),
        SizedBox(width: 10.w),
        Text(
          'PharmaDoc',
          style: TextStyles.font24BlackBold,
        ),
      ],
    );
  }
}