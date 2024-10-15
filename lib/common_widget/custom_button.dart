import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.onPressed,
      required this.btnText,
      required this.width,
      required this.height});

  var onPressed;
  double? width, height;
  String btnText = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style:
            ButtonStyle(backgroundColor: WidgetStatePropertyAll(buttonColor)),
        child: Text(
          btnText,
          style: TextStyle(color: gradient2,fontSize: 14.h),
        ),
      ),
    );
  }
}
