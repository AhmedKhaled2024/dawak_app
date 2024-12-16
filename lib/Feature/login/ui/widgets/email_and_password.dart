import 'package:dawak_24/Feature/login/ui/widgets/password_validations.dart';
import 'package:dawak_24/core/helpers/app_regex.dart';
import 'package:dawak_24/core/helpers/spacing.dart';
import 'package:dawak_24/core/widgets/app_text_from_field.dart';
import 'package:flutter/material.dart';


class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
 // @override
  bool isEmailValid = false;
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  //  late TextEditingController passwordController;
  //  late  TextEditingController emailController;
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
        super.dispose();
  
  }


  @override
  void initState() {
    super.initState();
    
    setupEmailControllerListener();
    setupPasswordControllerListener();
  }

  ///
  void setupPasswordControllerListener() {
    passwordController.addListener((){
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    }
    );
  }

  ///
    void setupEmailControllerListener() {
    emailController.addListener((){
      setState(() {
         isEmailValid = AppRegex.isEmailValid(emailController.text);
      });
    });

  // sign user in method //

  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
      child: Column(
        children: [
            AppTextFormField(
               controller: emailController,
           
            hintText: 'Email',
            
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: passwordController,
            hintText: 'Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty||!AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
               return null;
            },
          ),

          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      )
      
      );
  }

}