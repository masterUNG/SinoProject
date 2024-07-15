// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sinoproject/models/insx_model.dart';
import 'package:sinoproject/models/user_model.dart';
import 'package:sinoproject/states/main_home.dart';
import 'package:sinoproject/utility/app_controller.dart';
import 'package:sinoproject/utility/app_dialog.dart';
import 'package:sinoproject/widgets/widget_button.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<List<InsxModel>> readInsx() async {
    var insxModels = <InsxModel>[];

    var mapUser = await GetStorage().read('mapUserModel');
    UserModel userModel = UserModel.fromMap(mapUser);

    String urlAPI =
        'https://www.pea23.com/apipsinsx/getInsxWhereUser.php?isAdd=true&worker_name=${userModel.staffname}';

    var result = await Dio().get(urlAPI);

    if (result.toString() != 'null') {
      for (var element in json.decode(result.data)) {
        // print('element ---> $element');

        InsxModel model = InsxModel.fromMap(element);
        insxModels.add(model);
      }
    }

    return insxModels;
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
        'https://www.pea23.com/apipsinsx/getUserWhereUserSinghto.php?isAdd=true&username=$user';

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
