import 'dart:async';

import 'package:get/get.dart';
import 'package:ivy_contact/views/auth/signup.dart';



class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    // Check if the user has seen the boarding screens before

    // Navigate to the appropriate screen
    Timer(const Duration(seconds: 3), () {
      Get.to(SignUp());
    });
  }


}
