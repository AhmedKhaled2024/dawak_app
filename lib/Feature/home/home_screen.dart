import 'package:dawak_24/Feature/home/ui/widgets/categories_listview_card.dart';
import 'package:dawak_24/Feature/home/ui/widgets/home_top_bar.dart';
import 'package:dawak_24/core/helpers/spacing.dart';
import 'package:dawak_24/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/widgets/button_navigation_bar.dart';
import 'ui/widgets/doctor_specaility_see_all.dart';
import 'ui/widgets/doctor_specialist_list_view.dart';
import 'ui/widgets/doctors_list_view.dart';
import 'ui/widgets/order_medicine_blue_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea
      (child: Container(
        width: double.infinity,
        margin:const EdgeInsets.fromLTRB(
           20,
           16,
           20,
           28
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                const HomeTopBar(),
                const OrderMedicineBlueContainer(),
                verticalSpace(24.h),
                const DoctorSpecialitySeeAll(),
                verticalSpace(16),
                const DoctorSpecailityListView(),
                const DoctorsListView(),
               
             ],
           ), 
           
           

      )),
      bottomNavigationBar:const ButtonNavigationBar(),
    );
  }
}