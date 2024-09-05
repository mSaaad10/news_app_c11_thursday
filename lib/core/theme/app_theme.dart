import 'package:flutter/material.dart';

class AppTheme {
  static const Color greenColor = Color(0xFF39A552);
  static ThemeData appLightTheme = ThemeData(
      primaryColor: greenColor,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: greenColor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          )),
          titleTextStyle: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white)),
      scaffoldBackgroundColor: Colors.transparent);
}
