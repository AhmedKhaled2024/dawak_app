import 'package:flutter/material.dart';
import '../../../core/theming/styles.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       // SvgPicture.asset('assets/svg/logo_background.svg',),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset('assets/images/online-healthcare-service.png'),
        ),
        Positioned(
         
          bottom: 0,
          left: 0,
          right: 0,
          child: Text(
            'Net Pharmacy &\n Doctor App',
            textAlign: TextAlign.center,
            style: TextStyles.font32BurpleBold.copyWith(
              height: 1.3,
            ),
            
          ),
        ),
        
      ],
    );
  }
}