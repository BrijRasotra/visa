import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utils/constant.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.controller,
      required this.hintText,
      required this.keyboardType,
      required this.length,
      required this.isselect});

  TextEditingController controller = TextEditingController();
  String hintText = '';
  TextInputType keyboardType;
  var length = 1;
  bool isselect;

  @override
  Widget build(BuildContext context) {
    return isselect
        ? TextFormField(
            maxLines: length,
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderSide: BorderSide(color: textColor)),
              enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: textColor)),
              hintText: hintText,
            ),
          )
        : Container(
            padding: EdgeInsets.only(left: 20.h, top: 4.h, bottom: 4.h),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadow,
                borderRadius: BorderRadius.circular(10.h)),
            child: TextFormField(
              maxLines: length,
              controller: controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: hintText,
              ),
            ),
          );
  }
}
