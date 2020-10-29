import 'package:flutter/material.dart';
import 'package:rena/utils/colors.dart';

ThemeData appTheme() {
  return ThemeData(
      primarySwatch: createMaterialColor(Color(0xFFF000539)),
      accentColor: Colors.orange,
      hintColor: Colors.white,
      buttonColor: Colors.white,
      scaffoldBackgroundColor: createMaterialColor(Color(0xFFF000539)),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontFamily: "Montserrat",
        ),
        bodyText2: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: "Montserrat",
        ),
        caption: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 16,
          color: Colors.white,
        ),
        headline2: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 30,
          color: Colors.white,
          decoration: TextDecoration.underline,
          decorationColor: Colors.cyan,
          fontWeight: FontWeight.bold,
        ),
        headline1: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 34,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ));
}
