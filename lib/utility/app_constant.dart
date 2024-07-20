import 'package:flutter/material.dart';

class AppConstant {
  static String domain = 'https://www.pea23.com';
  // static String domainB = 'https://www.pea23.com';

  static Color mainColor = const Color.fromARGB(255, 9, 132, 203);

  BoxDecoration curbeBox() => BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(8));
}
