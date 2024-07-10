import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinoproject/states/authen.dart';
import 'package:sinoproject/utility/app_constant.dart';
import 'package:sinoproject/utility/app_http_override.dart';

void main() {
  HttpOverrides.global = AppHttpOverride();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Authen(),
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: AppConstant.mainColor)),
    );
  }
}
