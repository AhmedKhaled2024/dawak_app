import 'package:dawak_24/core/helpers/spacing.dart';
import 'package:dawak_24/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text("Doctor Specaility",style: TextStyles.font18DarkBlueSemiBold),
       const Spacer(),
      // horizontalSpace(20),
        Text("See All",style: TextStyles.font13purpleRegular),
      ],
    );
  }
}