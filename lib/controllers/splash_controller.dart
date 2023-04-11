import 'dart:async';

import 'package:get/get.dart';

import '../views/auth/login.dart';


class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    // Check if the user has seen the boarding screens before

    // Navigate to the appropriate screen
    Timer(const Duration(seconds: 3), () {
      Get.to(Login());
    });
  }


}
