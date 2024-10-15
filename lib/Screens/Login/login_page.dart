import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visa_officer_insider_secrets/Screens/Login/Controller/login_controller.dart';
import 'package:visa_officer_insider_secrets/common_widget/custom_button.dart';
import '../../Utils/constant.dart';
import '../../common_widget/custom_textfield.dart';
import '../../common_widget/waiting_Page.dart';
import '../../main.dart';

class LoginPage extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => FadeTransition(
        opacity: controller.animation as Animation<double>,
        child: Scaffold(
          backgroundColor: gradient1,
          body: Padding(
            padding: EdgeInsets.only(left: 10.h, right: 10.h),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/login3.png",
                      ),
                    ),
                    Text(
                      "Welcome!",
                      style: GoogleFonts.abel(
                          fontSize: 22.h,
                          fontWeight: FontWeight.bold,
                          color: textColor),
                    ),
                    Text(
                      "To access Visa Officer Insider Secrets enter the email address you used for your purchase.",
                      style:
                          GoogleFonts.roboto(fontSize: 14.h, color: textColor),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomTextField(
                      controller: controller.emailController.value,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      length: 1,
                      isselect: false,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Center(
                      child: CustomButton(
                        onPressed: () {
                          if (controller.emailController.value.text.isEmpty) {
                            controller.emailController.value.clear();
                            Get.snackbar(
                              'Login',
                              "Enter email",
                              colorText: buttonColor,
                              backgroundColor: gradient2,
                              icon: Icon(
                                Icons.add_alert,
                                color: buttonColor,
                              ),
                            );
                          } else {
                            controller.login();
                          }
                        },
                        btnText: 'Submit',
                        width: 200.h,
                        height: 40.h,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Text(
                          "V: $AppversionName",
                          style: GoogleFonts.acme(fontSize: 14.h),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
