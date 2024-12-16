import 'package:dawak_24/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class DoctorRecommendationCard extends StatelessWidget {
  final String name;
  final String speciality;
  final String hospital;
  final double rating;
  final int reviews;
  final String imageUrl;

  DoctorRecommendationCard({
    required this.name,
    required this.speciality,
    required this.hospital,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {

  // return Container(
  //   margin: EdgeInsets.all(10),
  //   child:Row(
  //     children: [
  //       Container(
  //         width: 100,
  //         height: 100,
  //         child: Image.asset(imageUrl),
  //       ),
  //       horizontalSpace(5),
  //       ListTile(

  //       ),
  //     ],
  //   ),

  //   ,


  // );










  // }
  
  
  // }




    return Card(
      elevation:10 ,
      child: ListTile(
        
        leading: Container(
          
        child:  Image.asset(imageUrl),
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$speciality | $hospital'),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 16),
                Text('$rating ($reviews reviews)'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
