import 'package:dawak_24/core/theming/colors.dart';
import 'package:dawak_24/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Hi,',
                style: TextStyles.font18purpleSemiBold,
              ),
              TextSpan(
                text: ' Ahmed!\n',
                style: TextStyles.font20DarkBlueMedium,
              ),
              TextSpan(
                text: ' How are you today',
                style: TextStyles.font13GrayRegular.copyWith(height: 1.5),
              ),
              
            ],
          ),
        ),
        const Spacer(),
        CircleAvatar( 
          radius: 24,
          backgroundColor: ColorsManager.lighterGray,
        child:  SvgPicture.asset('assets/svg/notifications_icon.svg'),

        ),
      ],
      
    );
  }
}