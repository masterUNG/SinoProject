import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxBool redEye = true.obs;

  RxInt indexBody = 0.obs;

  RxList<Position> positions = <Position>[].obs;
}
