// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:sinoproject/models/insx_model.dart';
import 'package:sinoproject/models/user_model.dart';
import 'package:sinoproject/states/main_home.dart';
import 'package:sinoproject/utility/app_constant.dart';
import 'package:sinoproject/utility/app_controller.dart';
import 'package:sinoproject/utility/app_dialog.dart';
import 'package:sinoproject/widgets/widget_button.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> readInsxHistory() async {
    var mapUser = await GetStorage().read('mapUserModel');
    UserModel userModel = UserModel.fromMap(mapUser);

    String urlAPI =
        '${AppConstant.domain}/apipsinsx/getInsxWhereUserHis.php?isAdd=true&worker_name=${userModel.staffname}';

    var result = await Dio().get(urlAPI);

    if (result.toString() != 'null') {
      if (appController.insxHistoryModels.isNotEmpty) {
        appController.insxHistoryModels.clear();
      }

      for (var element in json.decode(result.data)) {
        InsxModel model = InsxModel.fromMap(element);
        appController.insxHistoryModels.add(model);
      }
    }
  }

  Future<void> processConfirmOver150(
      {required String invoiceNo, required double distanceMeter}) async {
    String distance2digi = convertNumberTwoDigi(number: distanceMeter);

    String urlAPI =
        '${AppConstant.domain}/apipsinsx/ .php?isAdd=true&invoice_no=$invoiceNo&distance=$distance2digi';

    await Dio().get(urlAPI);
  }

  String convertNumberTwoDigi({required double number}) {
    NumberFormat numberFormat = NumberFormat('##0.00', 'en_US');

    String numberString = numberFormat.format(number);
    return numberString;
  }

  double calculateDistance({
    required double lat1,
    required double lng1,
    required double lat2,
    required double lng2,
  }) {
    double distance = 0;

    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
    distance = 12742 * asin(sqrt(a));

    return distance;
  }

  double findColorHue({required String notiDate}) {
    double colorHue = 120.0;

    var strings = <String>[];
    strings = notiDate.split(' ');
    if (strings.isNotEmpty) {
      // print('##20july strint[0] ---> ${strings[0]}');

      var notiDates = <String>[];
      notiDates = strings[0].split('-');

      DateTime notiDateTime = DateTime(
        int.parse(notiDates[0]),
        int.parse(notiDates[1]),
        int.parse(notiDates[2]),
      );

      print('##20july notiDateTime ---> $notiDateTime');

      DateTime currentDateTime = DateTime.now();

      var diff = currentDateTime.difference(notiDateTime);

      int differanceDay = diff.inDays + 1;

      print('##20july differanceDay ---> $differanceDay');

      if (differanceDay >= 7) {
        colorHue = 355.0;
      } else if (differanceDay >= 4) {
        colorHue = 240.0;
      } else if (differanceDay >= 2) {
        colorHue = 60.0;
      } else {
        colorHue = 120.0;
      }
    }

    // return 120.0;
    return colorHue;
  }

  Future<Widget> findWidgetPindrop({required String notiDate}) async {
    // double colorHue = 120.0;

    Color color = AppConstant.colorHue120;

    var strings = <String>[];
    strings = notiDate.split(' ');
    if (strings.isNotEmpty) {
      // print('##20july strint[0] ---> ${strings[0]}');

      var notiDates = <String>[];
      notiDates = strings[0].split('-');

      DateTime notiDateTime = DateTime(
        int.parse(notiDates[0]),
        int.parse(notiDates[1]),
        int.parse(notiDates[2]),
      );

      print('##20july notiDateTime ---> $notiDateTime');

      DateTime currentDateTime = DateTime.now();

      var diff = currentDateTime.difference(notiDateTime);

      int differanceDay = diff.inDays + 1;

      print('##20july differanceDay ---> $differanceDay');

      if (differanceDay >= 7) {
        // colorHue = 355.0;
        color = AppConstant.colorHue355;
      } else if (differanceDay >= 4) {
        // colorHue = 240.0;
        color = AppConstant.colorHue240;
      } else if (differanceDay >= 2) {
        // colorHue = 60.0;
        color = AppConstant.colorHue60;
      } else {
        // colorHue = 120.0;
        color = AppConstant.colorHue120;
      }
    }

    // return 120.0;
    return Icon(
      Icons.pin_drop,
      color: color,
    );
  }

  Future<void> readInsx() async {
    var mapUser = await GetStorage().read('mapUserModel');
    UserModel userModel = UserModel.fromMap(mapUser);

    // String urlAPI =
    //     '${AppConstant.domain}/apipsinsx/getInsxWhereUser.php?isAdd=true&worker_name=${userModel.staffname}';
    String urlAPI =
        'https://www.pea23.com/apipsinsx/getInsxWhereUser.php?isAdd=true&worker_name=${userModel.staffname}';

    print('## urlAPI --> $urlAPI');

    var result = await Dio().get(urlAPI);

     if (appController.insxModels.isNotEmpty) {
        appController.insxModels.clear();
        appController.insxHue355Models.clear();
        appController.insxHue240Models.clear();
        appController.insxHue120Models.clear();
        appController.insxHue60Models.clear();
      }

    if (result.toString() != 'null') {


     

      for (var element in json.decode(result.data)) {
        // print('element ---> $element');

        InsxModel model = InsxModel.fromMap(element);
        appController.insxModels.add(model);

        var strings = <String>[];
        strings = model.noti_date.split(' ');
        if (strings.isNotEmpty) {
          // print('##20july strint[0] ---> ${strings[0]}');

          var notiDates = <String>[];
          notiDates = strings[0].split('-');

          DateTime notiDateTime = DateTime(
            int.parse(notiDates[0]),
            int.parse(notiDates[1]),
            int.parse(notiDates[2]),
          );

          print('##20july notiDateTime ---> $notiDateTime');

          DateTime currentDateTime = DateTime.now();

          var diff = currentDateTime.difference(notiDateTime);

          int differanceDay = diff.inDays + 1;

          print('##20july differanceDay ---> $differanceDay');

          if (differanceDay >= 7) {
            // colorHue = 355.0;
            appController.insxHue355Models.add(model);
          } else if (differanceDay >= 4) {
            // colorHue = 240.0;
            appController.insxHue240Models.add(model);
          } else if (differanceDay >= 2) {
            // colorHue = 60.0;
            appController.insxHue60Models.add(model);
          } else {
            // colorHue = 120.0;
            appController.insxHue120Models.add(model);
          }
        }
      }
    }
  }

  Future<void> processFindPosition() async {
    bool locationService = await Geolocator.isLocationServiceEnabled();

    if (locationService) {
      //On Location

      LocationPermission locationPermission =
          await Geolocator.checkPermission();

      if (locationPermission == LocationPermission.deniedForever) {
        //ไม่อนุญาติเลย
        dialogCallLocationPermission();
      } else {
        //Alway, WhileInUser, Denied
        if (locationPermission == LocationPermission.denied) {
          //ไม่รู้ว่าอนุญาติ หรือไม่

          locationPermission = await Geolocator.requestPermission();

          if ((locationPermission != LocationPermission.always) &&
              (locationPermission != LocationPermission.whileInUse)) {
            //Denies Forwer
            dialogCallLocationPermission();
          } else {
            Position position = await Geolocator.getCurrentPosition();
            appController.positions.add(position);
          }
        } else {
          //Alway, WhileInUser
          Position position = await Geolocator.getCurrentPosition();
          appController.positions.add(position);
        }
      }
    } else {
      //Off Location
      AppDialog().normalDialog(
          title: 'Off Location Service',
          contentWidget: const Text('Please Open Location Service'),
          secondWidget: WidgetButton(
            text: 'Open Service',
            onPressed: () {
              Geolocator.openLocationSettings().then(
                (value) {
                  exit(0);
                },
              );
            },
          ));
    }
  }

  Future<void> processCheckLogin({
    required String user,
    required String password,
  }) async {
    print('user => $user, password = > $password');

    String urlAPI =
        '${AppConstant.domain}/getUserWhereUserSinghto.php?isAdd=true&username=$user';

    await Dio().get(urlAPI).then(
      (value) async {
        if (value.toString() == 'null') {
          Get.snackbar(
            'User False',
            'No $user in Database',
            backgroundColor: GFColors.DANGER,
            colorText: GFColors.WHITE,
          );
        } else {
          for (var element in json.decode(value.data)) {
            UserModel model = UserModel.fromMap(element);
            print('model ----> ${model.toMap()}');

            if (password == model.password) {
              Get.snackbar(
                  'Login Success', 'Welcome ${model.staffname} in Company App');

              Map<String, dynamic> mapUserModel = model.toMap();
              await GetStorage().write('mapUserModel', mapUserModel).then(
                (value) {
                  Get.offAll(const MainHome());
                },
              );
            } else {
              Get.snackbar('Password False', 'Please Try Again',
                  backgroundColor: GFColors.DANGER, colorText: GFColors.WHITE);
            }
          }
        }
      },
    );
  }

  void dialogCallLocationPermission() {
    AppDialog().normalDialog(
      title: 'ไม่อนุญาติแชร์พิกัด',
      contentWidget: const Text('Please Share Location'),
      secondWidget: WidgetButton(
        text: 'Share Locateion',
        onPressed: () {
          Geolocator.openAppSettings().then(
            (value) {
              exit(0);
            },
          );
        },
      ),
    );
  }
}
