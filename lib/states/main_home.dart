import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinoproject/utility/app_controller.dart';
import 'package:sinoproject/utility/app_service.dart';
import 'package:sinoproject/widgets/body_history.dart';
import 'package:sinoproject/widgets/body_main.dart';
import 'package:sinoproject/widgets/body_noti.dart';

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

  @override
  void initState() {
    super.initState();

    AppService().processFindPosition();

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
