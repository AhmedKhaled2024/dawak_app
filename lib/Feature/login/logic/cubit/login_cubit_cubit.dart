// import 'package:bloc/bloc.dart';
// import 'package:dawak_24/Feature/login/logic/cubit/login_cubit_state.dart';
// import 'package:flutter/material.dart';

// class LoginCubit extends Cubit<LoginState> {
//   final LoginRepo _loginRepo;
//   LoginCubit(this._loginRepo) : super(const LoginState.initial());

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   void emitLoginStates() async {
//     emit(const LoginState.loading());
//     final response = await _loginRepo.login(
//       LoginRequestBody(
//         email: emailController.text,
//         password: passwordController.text,
//       ),
//     );
//     response.when(success: (loginResponse) {
//       emit(LoginState.success(loginResponse));
//     }, failure: (error) {
//       emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
//     });
//   }
// }