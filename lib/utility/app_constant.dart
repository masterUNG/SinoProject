import 'package:flutter/material.dart';

class AppConstant {
  static Color colorHue355 = const Color.fromARGB(255, 206, 15, 2);
  static Color colorHue240 = const Color.fromARGB(255, 3, 18, 224);
  static Color colorHue120 = const Color.fromARGB(255, 3, 198, 36);
  static Color colorHue60 = const Color.fromARGB(255, 225, 236, 12);

  static String domain = 'https://www.pea23.com';
  // static String domainB = 'https://www.pea23.com';

  static Color mainColor = const Color.fromARGB(255, 9, 132, 203);

  BoxDecoration curbeBox({Color? color}) => BoxDecoration(
      border: Border.all(color: color ?? Colors.white),
      borderRadius: BorderRadius.circular(8));
}
