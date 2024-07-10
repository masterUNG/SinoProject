// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sinoproject/models/user_model.dart';

class AppService {
  Future<void> processCheckLogin({
    required String user,
    required String password,
  }) async {
    print('user => $user, password = > $password');

    String urlAPI =
        'https://www.pea23.com/apipsinsx/getUserWhereUserSinghto.php?isAdd=true&username=$user';

    await Dio().get(urlAPI).then(
      (value) {
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
            } else {
              Get.snackbar('Password False', 'Please Try Again',
                  backgroundColor: GFColors.DANGER, colorText: GFColors.WHITE);
            }
          }
        }
      },
    );
  }
}
