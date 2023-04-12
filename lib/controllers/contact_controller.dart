// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../utils/endpoints.dart';
//
//   class ContactListingController extends GetxController {
//
//
//
//     List contactList = [].obs;
//
//
//     Future<List> getContactList() async{
//
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String token = prefs.getString('token')!;
//
//       String userId = JwtDecoder.decode(token)['_id'];
//
//
//
//       var requestBody = {
//         'userId': userId,
//
//       };
//
//       var response = await http.post(
//         Uri.parse(ApiEndpoints.createContact),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(requestBody),
//       );
//
//       print(response.body);
//
//
//       return contactList;
//     }
//
//
//
//
//
//   }
