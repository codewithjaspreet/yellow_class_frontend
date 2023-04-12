import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import '../utils/endpoints.dart';

  class ContactListingController extends GetxController {





    // void addContact() async {
    //   var requestBody = {
    //
    //
    //     'firstName': firstNameController.text.trim(),
    //     'lastName': lastNameController.text.trim(),
    //     'designation': designationController.text.trim(),
    //     'phoneNumber': phoneNumberController.text.trim(),
    //   };
    //
    //   var response = await http.post(
    //     Uri.parse(ApiEndpoints.loginUser),
    //     headers: {
    //       'Content-Type': 'application/json',
    //     },
    //     body: jsonEncode(requestBody),
    //   );
    //
    //   print(response.body);
    //
    //
    //   if (response.statusCode == 200) {
    //     Get.snackbar('Success', 'Contact Added successfully',snackPosition: SnackPosition.BOTTOM,
    //
    //       backgroundColor: Colors.green,
    //       colorText: Colors.white,
    //     );
    //     Get.back();
    //   }
    //
    //   else {
    //     Get.snackbar('Error', 'Something went wrong');
    //   }
    // }

  }
