import 'package:dawak_24/Feature/home/ui/widgets/card_model.dart';
import 'package:dawak_24/Feature/home/ui/widgets/order_medicine_blue_container.dart';
import 'package:flutter/material.dart';

class CategoryListViewCard extends StatelessWidget {
   CategoryListViewCard({super.key,});
     
     List<CategoryModelCard> categories=[
      CategoryModelCard(title: 'Order medicine by\n nearst pharmacy', textButton: 'Uploading prescription', image: 'assets/svg/ordering_using_prescription_2.svg'),
      CategoryModelCard(title: 'Find the better doctor in all spcialist', textButton: 'search Now', image: 'assets/images/smartphone-doctor.png')
      
     ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder:(context,index)
          
          {
        return  ;//OrderMedicineBlueContainer(category:categories[index] ,) ;
          } ),
      ),
    );
  }
}