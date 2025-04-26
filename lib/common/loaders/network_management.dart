import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:smart_condo/utils/popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityResult =
      ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      final firstResult =
          results.isNotEmpty ? results.first : ConnectivityResult.none;
      _updateConnectionStatus(firstResult);
    });
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectivityResult.value = result;
    if (_connectivityResult.value == ConnectivityResult.none) {
      TLoaders.warningSnackBar(title: 'لا يوجد اتصال بالإنترنت');
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
