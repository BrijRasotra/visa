import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visa_officer_insider_secrets/Screens/Home_Screen/home_screen.dart';
import 'package:visa_officer_insider_secrets/Screens/Login/login_page.dart';
import 'package:visa_officer_insider_secrets/Utils/constant.dart';

import '../../Utils/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedContainer;
  Animation<double>? animation;
  var _translateTween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animatedContainer =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animatedContainer.forward();
    _translateTween = Tween<double>(begin: 500.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animatedContainer,
            curve: const Interval(0.0, 0.50, curve: Curves.ease)));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animatedContainer,
        curve: const Interval(0.70, 0.99, curve: Curves.fastOutSlowIn)));
    nextPage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: gradient1,
        body: AnimatedBuilder(
            animation: animatedContainer,
            builder: (context, child) {
              return Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, _translateTween.value, 0.0),
                  alignment: Alignment.center,
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/logo.png",
                            // scale: 4.h,
                          ),
                          SizedBox(height: 20.h),
                          ScaleTransition(
                              scale: animation!,
                              alignment: Alignment.center,
                              child: Text(
                                "Visa Officer Insider Secrets",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.acme(
                                    fontSize: 20.h, color: textColor),
                              )),
                        ],
                      )));
            }));
  }

  nextPage(BuildContext context) async {
    var email = await getEmail();
    if (email == null) {
      Future.delayed(const Duration(seconds: 3), () async {
        Get.off(LoginPage());
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () async {
        Get.off(const HomeScreen());
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animatedContainer.dispose();
  }
}
