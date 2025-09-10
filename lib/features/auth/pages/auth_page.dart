// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oyelabs/core/routes.dart';
import 'package:oyelabs/utils/assets.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _phone = TextEditingController();
  final _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 70.h),
              Center(
                child: Text(
                  "WELCOME BACK!",
                  style: GoogleFonts.interTextTheme().bodyLarge!.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 70.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(116, 130, 202, 100),
                ),
                onPressed: () {},
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10.w),
                      Image.network(
                        ImagePath.facebook,
                        height: 24.sp,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20.w),
                      Text(
                        "CONTINUE WITH FACEBOOK",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r),
                    side: BorderSide(color: Colors.grey.withOpacity(.3)),
                  ),
                ),
                onPressed: () {},
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10.w),
                      Image.network(ImagePath.google, height: 24.sp),
                      SizedBox(width: 20.w),
                      Text(
                        "CONTINUE WITH GOOGLE",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 130.h),

              Text(
                "OR CONTINUE WITH PHONE NUMBER",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 25.h),
              _textField(),
              SizedBox(height: 25.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.infinity, 63.h),
                    backgroundColor: Colors.black,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.otp);
                  },
                  child: Text(
                    "LOG IN",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DON'T HAVE AN ACCOUNT?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _textField() {
    return Container(
      width: double.infinity,
      height: 63.h,
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Row(
            children: [
              SizedBox(width: 20.w),
              Text("(USA)"),
              SizedBox(width: 10.w),
              Text("+1", style: GoogleFonts.robotoTextTheme().bodyMedium),
              Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
              SizedBox(
                height: 45.h,
                child: VerticalDivider(color: Colors.grey),
              ),
              SizedBox(width: 10.w),
              SizedBox(
                height: 50.h,
                width: 200.w,
                child: Center(
                  child: TextFormField(
                    controller: _phone,
                    showCursor: false,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.length > 10) {
                        return "Enter a valid phone number";
                      }
                      return null;
                    },
                    style: GoogleFonts.robotoTextTheme().bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter Mobile Number",
                      hintStyle: GoogleFonts.robotoTextTheme().bodyLarge!
                          .copyWith(fontWeight: FontWeight.normal),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
