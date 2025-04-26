import 'package:get/get.dart';
import 'package:smart_condo/common/loaders/network_management.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
