import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visa_officer_insider_secrets/Screens/Login/login_page.dart';
import 'local_storage.dart';

///decorations
var decoration = BoxDecoration(
  gradient: LinearGradient(
      colors: [gradient2, gradient1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter),
);

///navigation key
GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

///call to base url

/// local url
// final BASE_URL = "http://visaofficersecrets.com/";

////live url
final BASE_URL = "https://usvisahelp.me/";

///colors
// var gradient1 = Color(0xFF2D4B93);
var gradient1 = Color(0xFF9FCF94);
var gradient2 = Colors.white;
var textColor = Colors.black;
var buttonColor = Color(0xFF0D7C66);
var shadowColor = Colors.black12;
var shadowColor1 = Colors.black54;
var linkColor = Colors.blue.shade700;

///shadows
var shadow = [
  BoxShadow(color: shadowColor, offset: Offset(3, 3), blurRadius: 3),
  BoxShadow(color: shadowColor, offset: Offset(-3, -3), blurRadius: 3),
];

///appbar
commonAppBar({required String texts, required bool istrue, bool? isAction,var onPress}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      texts,
      style: GoogleFonts.cabin(
          fontWeight: FontWeight.bold, color: textColor, fontSize: 15.h),
    ),
    centerTitle: true,
    leading: istrue ? BackButton(color: textColor) : const SizedBox.shrink(),
    actions: [
      isAction == true
          ? IconButton(
              icon: Icon(Icons.logout),
              onPressed: onPress,
            )
          : SizedBox.shrink()
    ],
  );
}
