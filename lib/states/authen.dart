// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sinoproject/utility/app_controller.dart';
import 'package:sinoproject/utility/app_service.dart';
import 'package:sinoproject/widgets/widget_button.dart';
import 'package:sinoproject/widgets/widget_form.dart';
import 'package:sinoproject/widgets/widget_icon_button.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final keyForm = GlobalKey<FormState>();

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: Form(
                    key: keyForm,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 64),
                        userForm(),
                        const SizedBox(height: 16),
                        passwordForm(),
                        const SizedBox(height: 8),
                        loginButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  WidgetButton loginButton() {
    return WidgetButton(
      text: 'Login',
      onPressed: () {
        if (keyForm.currentState!.validate()) {
          AppService().processCheckLogin(
              user: userController.text, password: passwordController.text);
        }
      },
      fullWidthButton: true,
    );
  }

  Widget passwordForm() {
    return GetX<AppController>(
      init: AppController(),
      initState: (_) {},
      builder: (AppController appController) {
        return WidgetForm(
          controller: passwordController,
          validator: (p0) {
            if (p0?.isEmpty ?? true) {
              return 'Please Fill Password';
            } else {
              return null;
            }
          },
          obscureText: appController.redEye.value,
          hintText: 'Password :',
          suffixIcon: WidgetIconButton(
            icon: appController.redEye.value
                ? Icons.remove_red_eye
                : Icons.remove_red_eye_outlined,
            onPressed: () {
              appController.redEye.value = !appController.redEye.value;
            },
          ),
        );
      },
    );
  }

  WidgetForm userForm() {
    return WidgetForm(
      controller: userController,
      validator: (p0) {
        if (p0?.isEmpty ?? true) {
          return 'Please Fill User';
        } else {
          return null;
        }
      },
      hintText: 'User :',
      suffixIcon: const Icon(Icons.person_outline),
    );
  }
}
