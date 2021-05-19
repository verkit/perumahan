import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyTheme {
  static ThemeData light = ThemeData(
    textTheme: GoogleFonts.notoSansTextTheme(),
  );
}
