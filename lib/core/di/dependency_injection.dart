
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:graduation_project_2024/Core/networking/api_service.dart';
// import 'package:graduation_project_2024/Core/networking/dio_factory.dart';
// import 'package:graduation_project_2024/Features/login/data/repos/login_repo.dart';
// import 'package:graduation_project_2024/Features/sign_up/data/repos/sign_up_repo.dart';
// import 'package:graduation_project_2024/Features/sign_up/logic/cubit/sign_up_cubit.dart';
// import '../../features/login/logic/cubit/login_cubit.dart';
// //import 'package:graduation_project_2024/features/sign_up/data/repos/sign_up_repo.dart';


// final getIt = GetIt.instance;

// Future<void> setupGetIt() async {
//   // Dio & ApiService
//   Dio dio = DioFactory.getDio();
//   getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

//   // login
//   getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
//   getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

//    // signup
//   getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
//   getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

// }