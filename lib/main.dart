import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sinoproject/states/authen.dart';
import 'package:sinoproject/states/main_home.dart';
import 'package:sinoproject/utility/app_constant.dart';
import 'package:sinoproject/utility/app_http_override.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: '/authen',
    page: () => const Authen(),
  ),
  GetPage(
    name: '/mainHome',
    page: () => const MainHome(),
  ),
];

String? initRoute;

//Doramon

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = AppHttpOverride();

  await GetStorage.init().then(
    (value) {
      var mapUserModel = GetStorage().read('mapUserModel');
      print('##15july mapUserModel ---> $mapUserModel');

      if (mapUserModel == null) {
        initRoute = '/authen';
        runApp(const MyApp());
      } else {
        initRoute = '/mainHome';
        runApp(const MyApp());
      }

      
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      initialRoute: initRoute,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: AppConstant.mainColor)),
    );
  }
}
