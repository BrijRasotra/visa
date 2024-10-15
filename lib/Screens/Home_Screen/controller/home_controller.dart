import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visa_officer_insider_secrets/common_widget/custom_button.dart';
import '../../../Utils/constant.dart';
import '../../../Utils/local_storage.dart';
import '../../Login/login_page.dart';

class HomeController extends GetxController {
  Rx<TextEditingController> questionController = TextEditingController().obs;
  Rx<TextEditingController> answerController = TextEditingController().obs;
  RxBool load = false.obs;

  void logoutDialog() {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                title: Text(
                  "Are you sure?",
                  style: GoogleFonts.acme(fontSize: 17.h),
                ),
                content: Text(
                  'You want to logout an App',
                  style: GoogleFonts.roboto(fontSize: 15.h),
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  CustomButton(
                    onPressed: () {
                      Get.back();
                    },
                    btnText: "No",
                    width: 70.h,
                    height: 40.h,
                  ),
                  CustomButton(
                      onPressed: () async {
                        await clearDataBase();
                        Get.off(LoginPage());
                      },
                      btnText: "Yes",
                      width: 80.h,
                      height: 40.h)
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: navigationKey.currentState!.context,
        pageBuilder: (context, animation1, animation2) {
          return SizedBox();
        });
  }
}
