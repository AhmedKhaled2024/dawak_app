import 'package:dawak_24/Feature/home/ui/widgets/categories_listview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class HomeScreenTesst extends StatefulWidget {
  const HomeScreenTesst({super.key});

  @override
  State<HomeScreenTesst> createState() => _HomeScreenTesstState();
}

class _HomeScreenTesstState extends State<HomeScreenTesst> {
      
    int  _selecedPageIndex=0;

  void _selecedTabIndex(int index){
      _selecedPageIndex=index;
       
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Net Pharmacy'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: 
      CategoryListViewCard(),
      //  Padding(
      //   padding: const EdgeInsets.all(12.0),
      //   child: CustomScrollView(
      //     physics:const BouncingScrollPhysics(),
         
      //     slivers: [
            
      //            SliverToBoxAdapter(child: CategoryListViewCard()),
      //      const SliverToBoxAdapter(child: SizedBox(height: 30,)),
          
      //     ],
      //   ),
      // ),

           








      // SingleChildScrollView(


      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           'Hi, Omar!',
      //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //         ),
      //         Text(
      //           'How are you today?',
      //           style: TextStyle(fontSize: 16, color: Colors.grey),
      //         ),
      //         SizedBox(height: 20.h),
              
      //        Padding(
      //   padding: const EdgeInsets.all(12.0),
      //   child: CustomScrollView(
      //     physics: BouncingScrollPhysics(),
         
      //     slivers: [
      //            SliverToBoxAdapter(child: CategoryListViewCard()),
      //      const SliverToBoxAdapter(child: SizedBox(height: 30,)),
           
            
      //     ],
      //   ),
      // ),

      //        ///////// listview.builder
             
              
      //         Text(
      //           'Doctor Speciality',
      //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //         ),
      //         SizedBox(height: 10),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             SpecialityCard(icon: Icons.person, label: 'General'),
      //             SpecialityCard(icon: Icons.heart_broken, label: 'Neurologic'),
      //             SpecialityCard(icon: Icons.child_care, label: 'Pediatric'),
      //             SpecialityCard(icon: Icons.radio, label: 'Radiology'),
      //           ],
      //         ),
      //         SizedBox(height: 20),
      //         Text(
      //           'Recommendation Doctor',
      //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //         ),
      //         SizedBox(height: 10),
      //         DoctorRecommendationCard(
      //           name: 'Dr. Randy Wigham',
      //           speciality: 'General',
      //           hospital: 'RSUD Gatot Subroto',
      //           rating: 4.8,
      //           reviews: 4279,
      //           imageUrl: 'assets/images/doctor.avif',
      //         ),
      //         // Add more DoctorRecommendationCard widgets as needed
      //       ],
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        
      


       // backgroundColor: Colors.purple[200],
        elevation: 16,
        iconSize: 25,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: Colors.grey,), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined,color: Colors.grey,), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined,size: 40,color: Colors.purple,), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today,color: Colors.grey,), label: 'Appointments'),
          BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: AssetImage('assets/images/person_icon.png')), label: 'Profile'),
        ],
      ),
    );
  }
}
