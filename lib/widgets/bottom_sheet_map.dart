// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'package:sinoproject/models/insx_model.dart';
import 'package:sinoproject/utility/app_constant.dart';
import 'package:sinoproject/utility/app_controller.dart';
import 'package:sinoproject/utility/app_dialog.dart';
import 'package:sinoproject/utility/app_service.dart';
import 'package:sinoproject/widgets/widget_button.dart';
import 'package:sinoproject/widgets/widget_text_rich.dart';

class BottomSheetMap extends StatefulWidget {
  const BottomSheetMap({
    Key? key,
    required this.insxModel,
  }) : super(key: key);

  final InsxModel insxModel;

  @override
  State<BottomSheetMap> createState() => _BottomSheetMapState();
}

class _BottomSheetMapState extends State<BottomSheetMap> {
  AppController appController = Get.put(AppController());

  double? distanceMeter;

  @override
  void initState() {
    super.initState();

    distanceMeter = AppService().calculateDistance(
          lat1: appController.positions.last.latitude,
          lng1: appController.positions.last.longitude,
          lat2: double.parse(widget.insxModel.lat.trim()),
          lng2: double.parse(widget.insxModel.lng.trim()),
        ) *
        1000;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.35,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: Get.width,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetTextRich(head: 'ca : ', value: widget.insxModel.ca),
            WidgetTextRich(
                head: 'cus_name : ', value: widget.insxModel.cus_name),
            WidgetTextRich(head: 'pea_no : ', value: widget.insxModel.pea_no),
            Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: AppConstant().curbeBox(),
              child: WidgetTextRich(
                  head: 'ระยะห่าง : ',
                  value:
                      '${AppService().convertNumberTwoDigi(number: distanceMeter!)} m'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetButton(
                  text: 'บันทึกข้อมูล',
                  onPressed: () {
                    if (distanceMeter! >= 150.0) {
                      // Over 150

                      AppDialog().normalDialog(
                          title: 'เกิน 150 เมตร',
                          contentWidget: Text('เงื่อนไขในการทำ'),
                          firstWidget: WidgetButton(
                            text: 'ยืนยัน',
                            onPressed: () {
                              Get.back();
                              AppService()
                                  .processConfirmOver150(
                                      invoiceNo: widget.insxModel.invoice_no,
                                      distanceMeter: distanceMeter!)
                                  .then(
                                (value) {
                                  Get.back();
                                  AppService().readInsx();
                                },
                              );
                            },
                            type: GFButtonType.outline2x,
                          ));
                    } else {}
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
