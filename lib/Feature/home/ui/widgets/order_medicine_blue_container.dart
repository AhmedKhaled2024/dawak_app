
import 'package:dawak_24/Feature/uploading_Prescription/ui/tessst.dart';
import 'package:dawak_24/core/helpers/spacing.dart';
import 'package:dawak_24/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderMedicineBlueContainer extends StatelessWidget {
  const OrderMedicineBlueContainer({super.key});
 // final CategoryModelCard category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(alignment:Alignment.bottomCenter,
      children: [
        Container(
          height: 175.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
   decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),
          image:const DecorationImage(image: AssetImage('assets/images/Background_Container2.png'),
          fit: BoxFit.cover
          ),    
   ),
   child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        //'Order medicine by\n nearst pharmacy\n easy and fast',
        'Order medicine\nfrom nearest\npharmacy easly',
        style: TextStyles.font18WhiteMedium,
        textAlign: TextAlign.start,
      ),
      verticalSpace(16),
       Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return  UploadPrescriptionScreen ();
             }));  
   
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    child: Text(
                      'Ordering Now!',
                      style: TextStyles.font14BlueBold,
                    ),
                  ),
                ),
          ],
      ),
        ),

       Positioned(
            left:145.w ,
            right: 0.w,
            top: 0,
            child: Image.asset(
              'assets/images/order_medicine.png',
              height: 220.h,
             // width: 400.w,
            ),
          ),

      ],
      
      ),
    );
  }
}


class CategoryModelCard{
  
 final String title;
 final String textButton;
 final String image;

 const CategoryModelCard(
      {required this.title,
      required this.textButton,
      required this.image,
      });
}