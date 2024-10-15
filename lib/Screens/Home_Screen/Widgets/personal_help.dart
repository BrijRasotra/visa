import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visa_officer_insider_secrets/Utils/constant.dart';

class PersonalHelp extends StatelessWidget {
  PersonalHelp(this.name, {super.key});

  String name;

  TextEditingController questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradient1,
      appBar: commonAppBar(texts: name, istrue: true),
      body: AnimationLimiter(
        child: SingleChildScrollView(
          child: AnimationConfiguration.staggeredList(
            position: 2,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              horizontalOffset: 60.0,
              child: FadeInAnimation(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.h,
                        left: 10.h,
                        right: 10.h,
                      ),
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                          color: gradient2,
                          boxShadow: shadow,
                          borderRadius: BorderRadius.circular(10.h)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EasyVisaUS Agency, the creators of this guide, can offer additional, custom personalized help, for a reasonable fee:",
                            style: GoogleFonts.cabin(
                                fontSize: 13.h,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                size: 10.h,
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Text(
                                "If you are Doing-It-Yourself (DIY):",
                                style: GoogleFonts.cabin(
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            " - Personalized email Q&A \n - DS-160 form review \n - Interview preparation \n - Early interview date scheduling",
                            style: GoogleFonts.cabin(
                                fontSize: 14.h, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(children: [
                            const Icon(
                              Icons.circle_rounded,
                              size: 10,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "If you are looking for full help:",
                              style: GoogleFonts.cabin(
                                  fontSize: 14.h, fontWeight: FontWeight.bold),
                            ),
                          ]),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            " - Full Application help from start to finish",
                            style: GoogleFonts.cabin(
                                fontSize: 14.h, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          InkWell(
                            onTap: () async {
                              const url = 'https://visaofficersecrets.com';
                              if (await canLaunch(url)) {
                                await launch(url,
                                    forceWebView: true, enableJavaScript: true);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text:
                                      "For details and pricing, check our website at ",
                                  style: GoogleFonts.cabin(
                                      fontSize: 13.h,
                                      color: textColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: "https://visaofficersecrets.com",
                                  style: GoogleFonts.cabin(
                                      fontSize: 13.h,
                                      color: linkColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                            ),
                          ),

                          // https://visaofficersecrets.com
                        ],
                      ),
                    ),
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
