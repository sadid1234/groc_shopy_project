import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:groc_shopy/core/custom_assets/assets.gen.dart';
import 'package:camera/camera.dart';
import 'core/routes/routes.dart';
import 'utils/app_colors/app_colors.dart';

late final List<CameraDescription> cameras;

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (_, context) {
          return GetMaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Groc Shopy',
            theme: ThemeData(
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              scaffoldBackgroundColor: AppColors.backgroundF5F0EC,
              useMaterial3: true,
            ),
            routeInformationParser: AppRouter.route.routeInformationParser,
            routerDelegate: AppRouter.route.routerDelegate,
            routeInformationProvider: AppRouter.route.routeInformationProvider,
          );
        });
  }
}
