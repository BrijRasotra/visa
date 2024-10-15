import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visa_officer_insider_secrets/Utils/constant.dart';

void openWaitingDialog() {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              title: Center(
                child: CircularProgressIndicator(
                  color: linkColor,
                ),
              ),
              content: Text(
                'Please Wait...',
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(),
              ),
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
