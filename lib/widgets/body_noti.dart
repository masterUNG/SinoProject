import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sinoproject/utility/app_controller.dart';
import 'package:sinoproject/utility/app_service.dart';

class BodyNoti extends StatefulWidget {
  const BodyNoti({super.key});

  @override
  State<BodyNoti> createState() => _BodyNotiState();
}

class _BodyNotiState extends State<BodyNoti> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: AppController(),
      initState: (_) {},
      builder: (AppController appController) {
        return appController.positions.isEmpty
            ? const SizedBox()
            : appController.insxModels.isEmpty
                ? const Center(
                    child: Text(
                    'ไม่มีงาน',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ))
                : GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(appController.positions.last.latitude,
                            appController.positions.last.longitude), zoom: 16),
                  );
      },
    );
  }
}
