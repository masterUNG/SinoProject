import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sinoproject/models/insx_model.dart';

class AppController extends GetxController {
  RxBool redEye = true.obs;

  RxInt indexBody = 0.obs;

  RxList<Position> positions = <Position>[].obs;

  RxList<InsxModel> insxModels = <InsxModel>[].obs;
}
