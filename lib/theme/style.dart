import 'package:flutter/material.dart';
import 'package:rena/utils/colors.dart';

ThemeData darkTheme() {
  return ThemeData(
      primarySwatch: createMaterialColor(Color(0xFFF000539)),
      iconTheme: IconThemeData(color: Colors.white),
      shadowColor: Colors.white,
      accentColor: Colors.orange,
      hintColor: Colors.white,
      highlightColor: Colors.cyan,
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

ThemeData lightTheme() {
  return ThemeData(
      primarySwatch: createMaterialColor(Colors.white),
      shadowColor: Colors.grey,
      accentColor: Colors.orange,
      hintColor: Colors.white,
      buttonColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontFamily: "Montserrat",
        ),
        bodyText2: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontFamily: "Montserrat",
        ),
        caption: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 16,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 30,
          color: Colors.black,
          decoration: TextDecoration.underline,
          decorationColor: Colors.cyan,
          fontWeight: FontWeight.bold,
        ),
        headline1: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 34,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ));
}
