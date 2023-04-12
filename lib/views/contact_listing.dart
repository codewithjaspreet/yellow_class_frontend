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
  ContactListing({Key? key, required this.token}) : super(key: key);

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

   List items = [] ;


  @override
  void initState() {
    // TODO: implement onInit

    Map<String, dynamic> myToken = JwtDecoder.decode(widget.token);

    email = myToken['email'];
    userId = myToken['_id'];
    getContactList(userId);
  }


  void getContactList(userId) async {
    var regBody = {

      'userId':userId
    };
    var response = await http.post(Uri.parse(ApiEndpoints.getContactList),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(regBody)
    );
    var jsonResponse =  jsonDecode(response.body);
    items = jsonResponse['success'];

    setState(() {

    });



    if (response.statusCode == 200) {

      print(jsonResponse);
      Get.snackbar(
        'Success',
        'Contact Added successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );

    } else {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  void addContact() async {
    var requestBody = {
      'userId': userId,
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
      Get.snackbar(
        'Success',
        'Contact Added successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
      Get.back();
      lastNameController.clear();
      firstNameController.clear();
      designationController.clear();
      phoneNumberController.clear();
    } else {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
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
                            Text(
                              " ✔️ Add New Contact ✔️ ",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: "roboto_medium",
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              child: Column(
                                children: [
                                  InputFeild(
                                    labelText: 'firstName',
                                    hint: 'FirstName',
                                    controller: firstNameController,
                                  ),
                                  InputFeild(
                                    labelText: 'lastName',
                                    hint: 'LastName',
                                    controller: lastNameController,
                                  ),
                                  InputFeild(
                                    labelText: 'designation',
                                    hint: 'Designation',
                                    controller: designationController,
                                  ),
                                  InputFeild(
                                    labelText: 'phonenumber',
                                    hint: 'PhoneNumber',
                                    controller: phoneNumberController,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              child: ElevatedButton(
                                child: Text("Add Contact"),
                                onPressed: () {
                                  addContact();
                                  Navigator.pop(context);
                                },
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
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Yellow Class Contact Listing",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
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
            child: Container(
          height: MediaQuery.of(context).size.height,
          child:   ListView.builder(
            itemCount: items.length-1,
            padding: EdgeInsets.all(12.sp),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 12.sp),
                  height: 90.h,
                  width: 337.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                       children: [
                         Container(
                           margin: EdgeInsets.only(left: 12.sp),
                           width: 60.w,
                           height: 60.w,
                           decoration: const BoxDecoration(
                               color: Colors.purple, shape: BoxShape.circle),
                           child: Center(
                             child: Text(
                               '${items[index+1]['firstName'][0]}'.toUpperCase()  +  '${items[index+1]['lastName'][0]}'.toUpperCase(),
                               style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 20.sp,
                                   fontWeight: FontWeight.bold),
                             ),
                           ),
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Container(
                               margin: EdgeInsets.only(left: 16.sp),
                               child: Text('${items[index+1]['firstName']} ${items[index+1]['lastName']}'),
                             ),
                             Container(
                               margin: EdgeInsets.only(
                                 left: 16.sp,
                                 top: 2.sp,
                               ),
                               child:  Text('${items[index+1]['designation']}'),
                             ),
                             Container(
                               margin: EdgeInsets.only(left: 16.sp, top: 4.sp),
                               child:  Text('${items[index+1]['phoneNumber']}'),


                             )
                           ],
                         ),
                       ],
                     ),

                      Container(
                        margin: EdgeInsets.only(right: 12.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center ,
                          children: [

                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child:  Icon(Icons.delete , color: Colors.red,),
                            )
,
                            SizedBox(height: 12.h,),
                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child:  Icon(Icons.edit , color: Colors.green,),
                            )
                          ],
                        ),
                      )


                    ],
                  ),
                ),
              );
            },
          ),
        )));
  }
}
