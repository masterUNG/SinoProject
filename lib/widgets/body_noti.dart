import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sinoproject/models/insx_model.dart';
import 'package:sinoproject/states/list_search.dart';
import 'package:sinoproject/utility/app_constant.dart';
import 'package:sinoproject/utility/app_controller.dart';
import 'package:sinoproject/utility/app_service.dart';
import 'package:sinoproject/widgets/bottom_sheet_map.dart';

class BodyNoti extends StatefulWidget {
  const BodyNoti({super.key});

  @override
  State<BodyNoti> createState() => _BodyNotiState();
}

class _BodyNotiState extends State<BodyNoti> {
  GoogleMapController? googleMapController;

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
                : SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Stack(
                      children: [
                        displayMap(appController),
                        Column(
                          children: [
                            cardPindrop(
                              color: Colors.white,
                              icon: Icons.search,
                              amount: appController.insxModels.length,
                              onTap: () {
                                actionToListSearch(
                                  appController: appController,
                                  insxModels: appController.insxModels,
                                );
                              },
                            ),


                            cardPindrop(
                              color: AppConstant.colorHue120,
                              amount: appController.insxHue120Models.length,
                              onTap: () {
                                actionToListSearch(
                                  appController: appController,
                                  insxModels: appController.insxHue120Models,
                                );
                              },
                            ),


                            cardPindrop(
                              color: AppConstant.colorHue60,
                              amount: appController.insxHue60Models.length,
                              onTap: () {
                                actionToListSearch(
                                  appController: appController,
                                  insxModels: appController.insxHue60Models,
                                );
                              },
                            ),
                            cardPindrop(
                              color: AppConstant.colorHue240,
                              amount: appController.insxHue240Models.length,
                              onTap: () {
                                actionToListSearch(
                                  appController: appController,
                                  insxModels: appController.insxHue240Models,
                                );
                              },
                            ),
                            cardPindrop(
                              color: AppConstant.colorHue355,
                              amount: appController.insxHue355Models.length,
                              onTap: () {
                                actionToListSearch(
                                  appController: appController,
                                  insxModels: appController.insxHue355Models,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
      },
    );
  }

  void actionToListSearch({
    required AppController appController,
    required List<InsxModel> insxModels,
  }) {
    Get.to(ListSearch(insxModels: insxModels))?.then(
      (value) {
        if (value != null) {
          InsxModel model = value;

          googleMapController!
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(
                    double.parse(model.lat),
                    double.parse(model.lng),
                  ),
                  zoom: appController.zoomMoves.last)));

          googleMapController!.showMarkerInfoWindow(MarkerId(model.id));
        }
      },
    );
  }

  Widget cardPindrop({
    Color? color,
    Color? bgColor,
    IconData? icon,
    required int amount,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 8, left: 16),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: bgColor ?? Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.pin_drop,
              color: color,
              size: 36,
            ),
            Text(
              amount.toString(),
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  GoogleMap displayMap(AppController appController) {
    Map<MarkerId, Marker> mapMarker = {};
    for (var element in appController.insxModels) {
      MarkerId markerId = MarkerId(element.id);

      Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
            double.parse(element.lat.trim()), double.parse(element.lng.trim())),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            AppService().findColorHue(notiDate: element.noti_date)),
        infoWindow: InfoWindow(
            title: 'pea_no : ${element.pea_no}', snippet: element.cus_name),
        onTap: () {
          // print('##21july you tap');

          Get.bottomSheet(
            BottomSheetMap(
              insxModel: element,
            ),
            isScrollControlled: true,
          );
        },
      );

      mapMarker[markerId] = marker;
    }

    return GoogleMap(
      initialCameraPosition: CameraPosition(
          target: appController.latlngMoves.isEmpty
              ? LatLng(appController.positions.last.latitude,
                  appController.positions.last.longitude)
              : LatLng(appController.latlngMoves.last.latitude,
                  appController.latlngMoves.last.longitude),
          zoom: appController.zoomMoves.last),
      myLocationEnabled: true,
      markers: Set<Marker>.of(mapMarker.values),
      onCameraMove: (position) {
        appController.latlngMoves
            .add(LatLng(position.target.latitude, position.target.longitude));
        appController.zoomMoves.add(position.zoom);
      },
      onMapCreated: (controller) {
        googleMapController = controller;
      },
    );
  }
}
