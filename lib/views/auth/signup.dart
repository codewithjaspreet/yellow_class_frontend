import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivy_contact/views/auth/login.dart';
import 'package:ivy_contact/views/contact_listing.dart';

import '../../controllers/signup_controller.dart';


class SignUp extends StatefulWidget {
  // LoginController loginController = Get.put(LoginController());


  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {


  final FocusNode _passwordFocusNode = FocusNode();

  bool _obscureText = true;
  Color _passwordIconColor = const Color(0xffB4C6D4);

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> form = GlobalKey<FormState>();


    return Scaffold(

      appBar: AppBar(
        title: const Text("HappSales" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,

      ),
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(

                      children: [
                        Image.asset("assets/logo.png"),
                        SizedBox(height: 10.h,),
                        const Text("Login" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 50.h,),


              Form(
                key: form,
                child: Column(
                  children: [
                    TextFormField(
                      controller: signUpController.nameController,

                      // controller : loginController.emailController,
                      decoration: InputDecoration(

                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffff00a6d6)),
                        ),



                        hintText: "name *",
                        labelText: "UserName",

                        hintStyle: const TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(16.sp),
                        border: OutlineInputBorder(


                          borderSide: const BorderSide(color: Color(0xffff00a6d6)),

                          borderRadius: BorderRadius.all(Radius.circular(5.sp)),

                        ),
                      ),


                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(

                      controller: signUpController.emailController,

                      // controller : loginController.passwordController,
                      decoration: InputDecoration(

                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffff00a6d6)),
                        ),




                        hintText: "email *",
                        labelText: "Email",

                        hintStyle: const TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(16.sp),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xff00A6D6)),

                          borderRadius: BorderRadius.all(Radius.circular(5.sp)),

                        ),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      /**/
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      controller: signUpController.designationController,
                      // controller : loginController.orgController,
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffff00a6d6)),
                        ),
                        hintText: "Designation",
                        labelText: "designation",
                        hintStyle: const TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(16.sp),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffff00a6d6)),
                          borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                        ),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Organisation Code';
                        }
                        return null;
                      },

                    ),
/**/
                    // forgot password line

                    GestureDetector(
                      onTap: () {
                        // Get.to(() => const ForgotPassword());
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [

                            Text(
                              "Already have an account ? Login In",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],

                        ),
                      ),
                    ),
                    SizedBox(height: 30.h,),

                    GestureDetector(
                      child: Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              print("Sign Up tak aagya");
                              // loginController.loginWithEmail();
                              // _submitForm;
                              // loginController.loginWithEmail();
                              signUpController.registerUser();

                            },
                            style:

                            ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: const Color(0xff171A63)),
                            child: Text('Register' ,style:  TextStyle(fontWeight: FontWeight.bold ,fontSize: 16.sp),),
                          )
                      ),

                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),

    );
  }
}
