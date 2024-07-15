import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinoproject/widgets/widget_button.dart';

class AppDialog {
  void normalDialog({
    required String title,
    Widget? iconWidget,
    Widget? contentWidget,
    Widget? firstWidget,
    Widget? secondWidget,
  }) {
    Get.dialog(
      AlertDialog(
        icon: iconWidget,
        title: Text(title),
        content: contentWidget,
        actions: [
          firstWidget ?? const SizedBox(),
          secondWidget ??
              WidgetButton(
                  text: firstWidget == null ? 'OK' : 'Cancel',
                  onPressed: () => Get.back(),)
        ],
      ),
      barrierDismissible: false,
    );
  }
}
