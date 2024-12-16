import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class TermsAndConditionsText extends StatefulWidget {
   const TermsAndConditionsText({super.key});

  @override
  State<TermsAndConditionsText> createState() => _TermsAndConditionsTextState();
}

class _TermsAndConditionsTextState extends State<TermsAndConditionsText> {
  bool checkBoxValue=false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          autofocus: true,
          value: checkBoxValue,
          activeColor: const Color(0xff6149F7),
          onChanged:  (newValue) {
    setState(() {
      checkBoxValue = newValue!;
    });
  },),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'By logging, you agree to our\n',
                style: TextStyles.font13GrayRegular,
              ),
              TextSpan(
                text: ' Terms & Conditions',
                style: TextStyles.font13DarkBlueMedium,
              ),
              TextSpan(
                text: ' and',
                style: TextStyles.font13GrayRegular.copyWith(height: 1.5),
              ),
              TextSpan(
                text: ' Privacy Policy',
                style: TextStyles.font13DarkBlueMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}