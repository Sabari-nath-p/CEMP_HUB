import 'package:cemp_hub/color_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kLoginTitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.060,
      fontWeight: FontWeight.bold,
    );

TextStyle kLoginSubtitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.030,
    );

TextStyle kLoginTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: Colors.grey, height: 1.5);

TextStyle kHaveAnAccountStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: Colors.black);

TextStyle kLoginOrSignUpTextStyle(
  Size size,
) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: Color(0xFF990945),
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);

TextStyle usr() =>
    GoogleFonts.ibmPlexSansHebrew(fontSize: 14, fontWeight: FontWeight.bold);
TextStyle usrid() => GoogleFonts.pacifico(
      fontSize: 25,
      color: appcolor1(),
    );

TextStyle messtyle() => GoogleFonts.ibmPlexSans(
      fontSize: 16,
    );
