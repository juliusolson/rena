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
      caption: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 18,
        color: Colors.white,
      )
    )     
  );
}