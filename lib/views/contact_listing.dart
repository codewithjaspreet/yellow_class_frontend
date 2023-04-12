import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../utils/InputFeild.dart';
import 'package:http/http.dart' as http;
import '../utils/endpoints.dart';

class ContactListing extends StatefulWidget {
   ContactListing({Key? key ,required this.token}) : super(key: key);


  final String token;


  @override
  State<ContactListing> createState() => _ContactListingState();
}


class _ContactListingState extends State<ContactListing> {

  late String email;
  late String userId;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();


  @override
  void initState() {
    // TODO: implement onInit

    Map<String, dynamic> myToken = JwtDecoder.decode(widget.token);

     email = myToken['email'];
     userId = myToken['_id'];

  }

  void addContact() async {
    var requestBody = {


      'userId': userId,
      'firstName': firstNameController.text.trim(),
      'lastName': lastNameController.text.trim(),
      'designation': designationController.text.trim(),
      'phoneNumber': phoneNumberController.text.trim(),
    };

    var response = await http.post(
      Uri.parse(ApiEndpoints.createContact),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    print(response.body);


    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Contact Added successfully',snackPosition: SnackPosition.BOTTOM,

        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.back();
    }

    else {
      Get.snackbar('Error', 'Something went wrong');
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {

          showDialog(context: context,  builder: (BuildContext context) {

            return   AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.sp),
              ),
              content: Container(
                width: 430.w,
                height: 440.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(" ✔️ Add New Contact ✔️ " , style: TextStyle(fontSize: 20.sp , fontFamily: "roboto_medium" , fontWeight: FontWeight.w400),),
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: Column(

                          children: [

                            InputFeild(labelText: 'firstName', hint: 'FirstName', controller: firstNameController,),
                            InputFeild(labelText: 'lastName', hint: 'LastName', controller: lastNameController,),
                            InputFeild(labelText: 'designation', hint: 'Designation', controller: designationController,),
                            InputFeild(labelText: 'phonenumber', hint: 'PhoneNumber', controller: phoneNumberController,),


                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: ElevatedButton(

                          child: Text("Add Contact"),
                          onPressed: () => addContact(),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            );

          });

          // Get.to(() => AddContact());
        },
        child: const Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.black,
      ),

      appBar:   AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        "Yellow Class Contact Listing",
        style: TextStyle(
            color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Get.to(() => Menu());
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ],
    ),

      body: SingleChildScrollView(
        child: Center(

          child: Text(email)
        ),
      ),
    );
  }
}
