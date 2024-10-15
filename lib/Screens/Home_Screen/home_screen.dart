import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visa_officer_insider_secrets/Screens/Home_Screen/controller/home_controller.dart';
import 'package:visa_officer_insider_secrets/Utils/text%20page.dart';
import 'package:visa_officer_insider_secrets/common_widget/custom_textfield.dart';
import '../../Utils/constant.dart';
import 'package:get/get.dart';
import '../../Utils/local_storage.dart';
import '../Login/login_page.dart';
import 'Widgets/detail_Page.dart';
import 'Widgets/personal_help.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        backgroundColor: gradient1,
        appBar: commonAppBar(
            texts: 'Visa Officer Insider Secrets',
            istrue: false,
            isAction: true,
            onPress: ()  {
              controller.logoutDialog();

            }),
        body: AnimationLimiter(
          child: ListView.builder(
            itemCount: FAQ1.length,
            itemBuilder: (context, index) =>
                AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: InkWell(
                    onTap: () {
                      Get.to(
                          () => index == 3
                              ? PersonalHelp(FAQ1[index]['name'])
                              : DetailPage(
                                  FAQ1[index]['name'], FAQ1[index]['array']),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.downToUp);
                    },
                    child: Card(
                      margin: EdgeInsets.all(8.h),
                      shadowColor: shadowColor,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.h),
                            image: DecorationImage(
                                image: AssetImage(FAQ1[index]['image']),
                                fit: BoxFit.cover)),
                        child: Container(
                          color: shadowColor1,
                          height: 90.h,
                          padding: EdgeInsets.only(
                              top: 10.h, left: 10.h, right: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FAQ1[index]['name'],
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.h,
                                    color: gradient2),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: gradient2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
