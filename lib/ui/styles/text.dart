import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyTextStyle {
  static TextStyle descriptionHouse = GoogleFonts.notoSans(height: 1.5);
  static TextStyle readmore = GoogleFonts.notoSans(
    height: 1.5,
    color: Colors.greenAccent[400],
    fontWeight: FontWeight.w500,
  );
  static TextStyle statusHouse(status) => TextStyle(
        fontSize: 12,
        color: !status ? Colors.greenAccent[400] : Colors.red[600],
        fontWeight: FontWeight.bold,
      );
  static TextStyle titleHouse = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle smallCaption = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle description = TextStyle(height: 1.5);
}
