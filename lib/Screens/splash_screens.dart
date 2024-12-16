import 'package:dawak_24/Feature/home/home_screen.dart';
import 'package:dawak_24/Feature/login/ui/login_screen.dart';
import 'package:dawak_24/Feature/uploading_Prescription/ui/widgets/location_picker_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../Feature/uploading_Prescription/ui/tessst.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 final introKey = GlobalKey<IntroductionScreenState>();

 

  bool showNextButton = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 120),
      child: IntroductionScreen(
         key: introKey,
         allowImplicitScrolling: true,
         autoScrollDuration: 3000,
         infiniteAutoScroll: true,
         showSkipButton: true,
         showNextButton: showNextButton,
         showBackButton: false,
         showDoneButton: true,
        
     pages: [
        //  key: _introKey,
         PageViewModel(
            title: 'Online Doctor',
            body: 'Find the best doctors in all specialties and connect with him',
            image: Image.asset('assets/images/online_doctor5.png',width: double.infinity,),
            
              decoration: const PageDecoration(
              titleTextStyle: TextStyle(color: Color(0xff9B33FF),fontSize: 20,fontWeight: FontWeight.bold ),
              bodyTextStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0),
                  
              ),
            ),

          PageViewModel(
            title: 'Online Pharmacy',
            body: ' Uploade your prescribtion or Pictures of medicine easy ,You will get the medicine as soon as possible',
            image: Image.asset('assets/images/online-pharmacy-2.png',),
            
           
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(color: Color(0xff9B33FF),fontSize: 20,fontWeight: FontWeight.bold ),
              bodyTextStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                  
            ),
          ),
          PageViewModel(
            title: 'Services in App',
            body: '-Medical record of the patient.\n-Order medications online easy.\n-Health information and medical consultations.',
            

            image: Image.asset('assets/images/the _services.png'),
            
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(color: Color(0xff9B33FF),fontSize: 20,fontWeight: FontWeight.bold ),
              bodyTextStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          PageViewModel(
            title: 'Communication With Doctors',
            body: ' Through the information available about the doctor, you can contact him by message and book an appointment or medical consultation ',
            image: Image.asset('assets/images/smartphone-doctor.png'),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(color: Color(0xff9B33FF),fontSize: 20,fontWeight: FontWeight.bold ),
              bodyTextStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          PageViewModel(
            title: 'prescribtions App',
            body: 'Using machine learning to process prescriptions and match them to medications in pharmacies',
            image: SvgPicture.asset('assets/svg/Prescribing-Blog.svg'),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(color: Color(0xff9B33FF),fontSize: 20,fontWeight: FontWeight.bold ),
              bodyTextStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),

          PageViewModel(
            title: 'Medication Delivery',
            body: ' Fast delivery and follow-up on order status  ',
            image: Image.asset('assets/images/delivery_medicines.png'),
            decoration: pageDecoration
          ),
        ],
         skipOrBackFlex: 0,
       
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
       
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward,color: Colors.purple),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),

        
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
    
     ),
        nextFlex: 0,
      
      ),
    ),
    );
  }
}


////

void _onIntroEnd(context) {

Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return const LoginScreen();
  }));  
   
  }

 

 
  /// decoration ////
const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(color: Color(0xff9B33FF),fontSize: 20,fontWeight: FontWeight.bold ),
      bodyTextStyle:TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

