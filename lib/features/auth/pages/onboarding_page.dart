// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oyelabs/core/routes.dart';
import 'package:oyelabs/utils/assets.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _phone = TextEditingController();
  final _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _onboardingHero(),
              Text(
                "Your Home service Expert",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                "Continue with Phone Number",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Colors.grey,
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
                    "SIGN UP",
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
                  Navigator.pushNamed(context, AppRoutes.auth);
                },
                child: Text(
                  "VIEW OTHER OPTION",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ALREADY HAVE AN ACCOUNT?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.auth);
                    },
                    child: Text(
                      "LOG IN",
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

  SizedBox _onboardingHero() {
    return SizedBox(
      height: 490.h,
      child: Stack(
        children: [
          Image.asset(
            ImagePath.onboarding1,
            width: double.infinity,
            height: 479.h,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 100.h,
            left: 40.w,
            right: 40.w,
            child: Image.asset(
              ImagePath.onboarding2,
              width: 332.w,
              height: 242.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              ImagePath.onboarding3,
              width: double.infinity,
              height: 75.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
