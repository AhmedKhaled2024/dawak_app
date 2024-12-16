import 'package:flutter/material.dart';

class SpecialityCard extends StatelessWidget {
  final IconData icon;
  final String label;

 const SpecialityCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, size: 30, color: Colors.grey[800]),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.grey[800])),
      ],
    );
  }
}
