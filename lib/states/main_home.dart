// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sinoproject/models/insx_model.dart';
import 'package:sinoproject/states/authen.dart';

import 'package:sinoproject/utility/app_controller.dart';
import 'package:sinoproject/utility/app_dialog.dart';
import 'package:sinoproject/utility/app_service.dart';
import 'package:sinoproject/widgets/body_history.dart';
import 'package:sinoproject/widgets/body_main.dart';
import 'package:sinoproject/widgets/body_noti.dart';
import 'package:sinoproject/widgets/widget_button.dart';
import 'package:sinoproject/widgets/widget_menu.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>[
    'แจ้งเตือน',
    'ประวัติ',
    'หน้าหลัก',
  ];

  var icons = <IconData>[
    Icons.notifications,
    Icons.history,
    Icons.home,
  ];

  var bodys = <Widget>[
    const BodyNoti(),
    const BodyHistory(),
    const BodyMain(),
  ];

  List<BottomNavigationBarItem> items = [];

  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();

    AppService().processFindPosition();
    createInsxModels();
    createItems();
  }

  Future<void> createInsxModels() async {
    var insxModels = <InsxModel>[];
    insxModels = await AppService().readInsx();

    if (insxModels.isNotEmpty) {
      for (var element in insxModels) {
        appController.insxModels.add(element);
      }
    }
  }

  void createItems() {
    for (var i = 0; i < titles.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(icons[i]),
          label: titles[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: AppController(),
      initState: (_) {},
      builder: (AppController appController) {
        return Scaffold(
          appBar: AppBar(
            title: Text(titles[appController.indexBody.value]),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                DrawerHeader(child: Text('data')),
                const Spacer(),
                WidgetMenu(
                  title: 'Sign Out',
                  iconData: Icons.exit_to_app,
                  onTap: () {
                    Get.back();

                    AppDialog().normalDialog(
                      title: 'Sign Out',
                      contentWidget: const Text('Please Confirm for Sign Out'),
                      firstWidget: WidgetButton(
                        text: 'Confirm',
                        onPressed: () async {
                          await GetStorage().erase().then(
                            (value) {
                              Get.offAll(const Authen());
                            },
                          );
                        },
                        type: GFButtonType.outline2x,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          body: bodys[appController.indexBody.value],
          bottomNavigationBar: BottomNavigationBar(
            items: items,
            currentIndex: appController.indexBody.value,
            onTap: (value) {
              appController.indexBody.value = value;
            },
          ),
        );
      },
    );
  }
}
