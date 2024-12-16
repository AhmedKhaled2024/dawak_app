import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardModel extends StatelessWidget {
  const CardModel({required this.category,super.key});
final CategoryModel category;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          child: Stack(
            children: [
              // Background Container
              Container(
                decoration: BoxDecoration(
                  color: Colors.purple[500],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // Positioned Text
              Positioned(
                top: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     category.title,
                      
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Positioned Button
              Positioned(
                bottom: 20,
                left: 20,
               
                  child: Text(category.textButton),
                ),
              
              // Positioned Image
              Positioned(
                right: 10,
                bottom: 10,
                child: SvgPicture.asset(
                    category.image), // Assuming the image is saved in assets folder
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryModel{
  
 final String title;
 final String textButton;
 final String image;

 const CategoryModel(
      {required this.title,
      required this.textButton,
      required this.image,
      });
}