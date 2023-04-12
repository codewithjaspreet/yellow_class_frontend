import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFeild extends StatelessWidget {
  InputFeild({Key? key, required this.labelText, required this.hint, required this.controller}) : super(key: key);


  final String labelText;
  final String hint;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 12.h),
      child:  TextFormField(

          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            labelStyle: TextStyle(
              color: Colors.green,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
            ),
          )
      ),
    )
    ;
  }
}