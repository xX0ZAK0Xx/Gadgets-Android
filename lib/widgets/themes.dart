import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w900),
      centerTitle: true,
    ));
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBlue = Color.fromARGB(255, 31, 24, 51);
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,  
  );

}