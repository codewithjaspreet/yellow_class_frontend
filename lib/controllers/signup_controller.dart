import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/endpoints.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  void registerUser() async {


    var requestBody = {

      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'designation': designationController.text.trim(),
    };

    var response = await http.post(
      Uri.parse(ApiEndpoints.registerUser),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    print(response.body);
    }


  }



