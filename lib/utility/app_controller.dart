import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sinoproject/models/insx_model.dart';

class AppController extends GetxController {
  RxBool redEye = true.obs;
  RxInt indexBody = 0.obs;
  RxList<Position> positions = <Position>[].obs;

  RxList<LatLng> latlngMoves = <LatLng>[].obs;
  RxList<double> zoomMoves = <double>[12.0].obs;
  
  RxList<InsxModel> insxModels = <InsxModel>[].obs;
  RxList<InsxModel> insxHistoryModels = <InsxModel>[].obs;

  RxList<InsxModel> insxHue355Models = <InsxModel>[].obs;
  RxList<InsxModel> insxHue240Models = <InsxModel>[].obs;
  RxList<InsxModel> insxHue120Models = <InsxModel>[].obs;
  RxList<InsxModel> insxHue60Models = <InsxModel>[].obs;

  
}
