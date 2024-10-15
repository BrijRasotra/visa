import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visa_officer_insider_secrets/Screens/Home_Screen/controller/detail_controller.dart';
import 'package:visa_officer_insider_secrets/common_widget/custom_button.dart';
import '../../../Utils/constant.dart';
import '../../../common_widget/custom_textfield.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.name, this.array, {super.key});

  String name;
  List array;
  DetailController detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      backgroundColor: gradient1,
      appBar: commonAppBar(
        texts: name,
        istrue: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 7.h, right: 7.h),
        // decoration: decoration,
        child: AnimationLimiter(
          child: GetBuilder(
            init: DetailController(),
            builder: (controller) => SingleChildScrollView(
              child: Column(
                children: [
                  name == ""
                      ? Text(
                          "EasyVisaUS Agency, the creators of this guide, can offer additional, custom personalized help, for a reasonable fee:",
                          style: GoogleFonts.cabin(fontSize: 13.h),
                        )
                      : SizedBox.shrink(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    key: Key('builder ${controller.isSelect.value.toString()}'),
                    itemCount: array.length,
                    itemBuilder: (context, i) =>
                        AnimationConfiguration.staggeredList(
                            position: i,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                                horizontalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.h),
                                    child: Stack(
                                      children: [
                                        ExpansionTile(
                                          key: Key(i.toString()),
                                          title: Text(
                                            array[i]['que'],
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.h),
                                          ),
                                          onExpansionChanged: (val) {
                                            if (controller.isSelect.value ==
                                                i) {
                                              controller.isSelect.value = -1;
                                            } else {
                                              controller.isSelect.value = i;
                                            }
                                            controller.update();
                                          },
                                          trailing: SizedBox.shrink(),
                                          initiallyExpanded:
                                              controller.isSelect.value == i,
                                          maintainState:
                                              controller.isSelect.value == i,
                                          backgroundColor: gradient2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.h)),
                                          collapsedShape:
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.h)),
                                          collapsedBackgroundColor: gradient2,
                                          childrenPadding: EdgeInsets.only(
                                              left: 15.h,
                                              top: 8.h,
                                              right: 10.h,
                                              bottom: 10.h),
                                          children: [
                                            Text(
                                              array[i]['ans'],
                                              style: GoogleFonts.roboto(
                                                  fontSize: 11.h),
                                            ),
                                            array[i]['ans'] == ""
                                                ? CustomTextField(
                                                    controller: controller
                                                        .questionController
                                                        .value,
                                                    hintText:
                                                        'Asking for suggestions',
                                                    keyboardType:
                                                        TextInputType.text,
                                                    length: 4,
                                                    isselect: true,
                                                  )
                                                : SizedBox.shrink(),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            array[i]['ans'] == ""
                                                ? CustomButton(
                                                    onPressed: () {},
                                                    btnText: "Submit",
                                                    width: 200.h,
                                                    height: 35.h)
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                        Positioned(
                                            top: 0.h,
                                            right: 0.h,
                                            child: IconButton(
                                              onPressed: () {
                                                if (controller.isSelect.value ==
                                                    i) {
                                                  controller.isSelect.value =
                                                      -1;
                                                } else {
                                                  controller.isSelect.value = i;
                                                }
                                                controller.update();
                                              },
                                              icon: Icon(
                                                controller.isSelect.value == i
                                                    ? Icons
                                                        .keyboard_arrow_up_outlined
                                                    : Icons
                                                        .keyboard_arrow_down_outlined,
                                                size: 25.h,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => SuggestionPage(),
                duration: Duration(milliseconds: 500),
                transition: Transition.downToUp);
          },
          child: Icon(Icons.question_mark),
        )*/
    );
  }
}
