import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinoproject/utility/app_controller.dart';
import 'package:sinoproject/utility/app_service.dart';
import 'package:sinoproject/widgets/widget_text_rich.dart';

class BodyHistory extends StatefulWidget {
  const BodyHistory({super.key});

  @override
  State<BodyHistory> createState() => _BodyHistoryState();
}

class _BodyHistoryState extends State<BodyHistory> {
  @override
  void initState() {
    super.initState();

    AppService().readInsxHistory();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: AppController(),
      initState: (_) {},
      builder: (AppController appController) {
        return appController.insxHistoryModels.isEmpty
            ? const SizedBox()
            : ListView.builder(padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: appController.insxHistoryModels.length,
                itemBuilder: (context, index) => Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidgetTextRich(
                      head: 'Name :',
                      colorTextHead: Colors.indigo,
                      value: appController.insxHistoryModels[index].cus_name,
                      colorTextValue: Colors.black,
                    ),
                    WidgetTextRich(
                      head: 'Distance :',
                      colorTextHead: Colors.red,
                      value: '${appController.insxHistoryModels[index].distance} เมตร',
                      colorTextValue: Colors.black,
                    ),
                    const Divider(),
                  ],
                ),
              );
      },
    );
  }
}
