import 'package:flutter/material.dart';

import '../../../core/theming/styles.dart';

class ProfileUserPage extends StatelessWidget {
  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Text('profile',style: TextStyles.font13DarkBlueMedium,),
    );
  }
}