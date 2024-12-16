import 'package:dawak_24/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dawak_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   ScreenUtil.ensureScreenSize();
  await  Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( DawakApp(appRouter: AppRouter()));
}

