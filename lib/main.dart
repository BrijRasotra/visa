import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'Screens/Splash/splash_screens.dart';
import 'Utils/constant.dart';
import 'Utils/page_binding.dart';

var AppversionName;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    AppversionName = packageInfo.version;
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            title: '',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            navigatorKey: navigationKey,
            debugShowCheckedModeBanner: false,
            initialBinding: PageBinding(),
            home: SplashScreen(),
          );
        });
  }
}
