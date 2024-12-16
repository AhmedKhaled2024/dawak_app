import 'package:dawak_24/core/di/auth_page.dart';
import 'package:dawak_24/core/routing/routes.dart';
import 'package:dawak_24/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

class DawakApp extends StatelessWidget {
  const DawakApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dawak App',
        theme: ThemeData(
          primaryColor: ColorsManager.mainPurple,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: Routes.startScreen,
        onGenerateRoute: appRouter.generateRoute,
        home: const AuthPage(),
      ),
    );
  }
}
