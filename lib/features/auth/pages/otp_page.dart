import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oyelabs/core/routes.dart';
import 'package:oyelabs/utils/assets.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _formKey = GlobalKey();
  final _otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Center(
                child: Image.asset(
                  ImagePath.otp1,
                  height: 187.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 60.h),
              Text(
                "OTP Verification",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter the OTP sent to",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                  Text(
                    " +1 9879878975",
                    style: GoogleFonts.interTextTheme().bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70.h),
              Pinput(
                length: 4,
                controller: _otp,
                defaultPinTheme: PinTheme(
                  width: 50.w,
                  margin: EdgeInsets.all(10.w),
                  textStyle: GoogleFonts.interTextTheme().bodyLarge!.copyWith(
                    fontSize: 30.sp,
                  ),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OTP not received?",
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
                      "RESEND OTP",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
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
                    Navigator.pushNamed(context, AppRoutes.location);
                  },
                  child: Text(
                    "VERIFY & PROCEED",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
