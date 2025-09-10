// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oyelabs/core/routes.dart';
import 'package:oyelabs/utils/assets.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Hey, nice to meet you!",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "See services around",
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 60.h),
          Image.asset(ImagePath.location1, width: 310.w, height: 141.h),
          SizedBox(height: 60.h),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.home);
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_searching_rounded,
                    size: 24.sp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "Your current location",
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
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.home);
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 24.sp, color: Colors.black),
                  SizedBox(width: 20.w),
                  Text(
                    "Some other location",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}
