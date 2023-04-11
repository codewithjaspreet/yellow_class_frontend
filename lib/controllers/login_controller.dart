import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/endpoints.dart';
import '../views/contact_listing.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginController extends GetxController {



  @override

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    var requestBody = {

      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
    };

    var response = await http.post(
      Uri.parse(ApiEndpoints.loginUser),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    print(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', jsonDecode(response.body)['token']);

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'User registered successfully');
      Get.to( ContactListing(token:  jsonDecode(response.body)['token'] ,));
    }

    else {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

}

