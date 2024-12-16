import 'package:dawak_24/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SearchButtonNavigationBar extends StatelessWidget {
  const SearchButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Text('searching',style: TextStyles.font13DarkBlueMedium,),
    );
  }
}