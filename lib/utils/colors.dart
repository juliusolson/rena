import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

Map<String, MaterialColor> chartColors = {
  "pink": createMaterialColor(Color(0xffed1e79)), // rosa
  "orange": createMaterialColor(Color(0xfff15a24)), // orange
  "yellow": createMaterialColor(Color(0xfffbae17)), //gul
  "blue": createMaterialColor(Color(0xff7ec5ff)), //blå
  "purple": createMaterialColor(Color(0xff8333ff)), //lila
};
