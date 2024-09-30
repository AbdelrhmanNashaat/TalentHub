import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hire_me/constant.dart';

class CustomTextStyles {
  static TextStyle style30Bold = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: Constant.primaryColor,
  );
  static TextStyle style20Medium = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Constant.primaryColorWithOpacity50,
  );
  static TextStyle style14Light = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Constant.primaryColor,
  );
  static TextStyle style16Medium = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Constant.primaryColor,
  );
}
