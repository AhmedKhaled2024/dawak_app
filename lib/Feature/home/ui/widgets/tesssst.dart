import 'package:flutter/material.dart';

import 'categories_listview_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('News',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            Text(' Cloud',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
          ],
        )
        
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
         
          slivers: [
            SliverToBoxAdapter(child: CategoryListViewCard()),
            SliverToBoxAdapter(child: SizedBox(height: 30,)),
          //  DoctorSpecialistListViewBuilder(),
            //// --- على طول News_ListView() استخدمنا ال 
            //SliverToBoxAdapter(child: News_ListView()),
          ],
        ),
      ),
      
    );
  }
}

class DoctorSpecialistListViewBuilder {
}




