import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visa_officer_insider_secrets/Screens/Home_Screen/home_screen.dart';
import 'package:visa_officer_insider_secrets/Utils/constant.dart';
import '../../../Utils/base_service.dart';
import '../../../Utils/local_storage.dart';
import '../../../common_widget/waiting_Page.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  GlobalKey<FormState> formKey = GlobalKey();

  late AnimationController _controller;
  late Animation animation;
  BaseService baseController = Get.put(BaseService());
  RxBool load = false.obs;

  @override
  onInit() {
    super.onInit();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  Rx<TextEditingController> emailController = TextEditingController().obs;

  showPopup() {
    showGeneralDialog(
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Login',
                      style: GoogleFonts.poppins(
                          fontSize: 15.h, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: const Icon(Icons.clear),
                      onTap: () {
                        Get.back();
                      },
                    )
                  ],
                ),
                content: Text(
                    'Invalid email address to access Guide. Please try again. If this is incorrect contact support@test.com',
                    style: GoogleFonts.roboto(fontSize: 13.h)),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
        barrierLabel: '',
        context: navigationKey.currentState!.context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }

  login() async {
    load.value = true;
    update();
    openWaitingDialog();
    var response = await baseController.hitLogin(emailController.value.text);
    if (response.toString() == "yes ") {
      load.value = false;
      Get.back();
      localStore(emailController.value.text);
      emailController.value.clear();
      update();
      Get.off(() => const HomeScreen(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 500));
    } else {
      Get.back();
      load.value = false;
      showPopup();
      emailController.value.clear();
      update();
    }
  }
}
