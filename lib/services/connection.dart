// ignore_for_file: prefer_const_constructors

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectivityStatus);
  }

  void _updateConnectivityStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: Center(
            child: Text(
              'You Are Offline!',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          isDismissible: true,
          backgroundColor: Colors.red,
          //duration: Duration(days: 1),
          icon: Icon(
            Icons.wifi_off_outlined,
            color: Colors.white,
            size: 17,
          ),
          snackStyle: SnackStyle.GROUNDED);
    } else {
      Get.rawSnackbar(
          messageText: Center(
            child: Text(
              'You Are Back Online',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          isDismissible: true,
          backgroundColor: Colors.green,
          //duration: Duration(days: 1),
          icon: Icon(
            Icons.wifi_outlined,
            color: Colors.white,
            size: 17,
          ),
          snackStyle: SnackStyle.GROUNDED);
    }
  }
}
