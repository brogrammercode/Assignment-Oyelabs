// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oyelabs/utils/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _nav(
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Image.asset(
              ImagePath.home1,
              width: double.infinity,
              height: 230.h,
              fit: BoxFit.cover,
            ),
            _divider(),
            _categories(),
            _divider(),
            SizedBox(height: 20.h),
            _serviceRow(title: 'Popular Services', items: popularServices),
            _divider(),
            SizedBox(height: 20.h),
            _serviceRow(title: 'Cleaning Services', items: cleaningServices),
            _divider(),
            _badges(badges: badges),
            _divider(),
            _benefits(title: 'Why Choose Us', benefits: benefits),
            SizedBox(height: 20.h),
            _band(),
            SizedBox(height: 20.h),
            _measures(measures: measures),
            SizedBox(height: 100.h),
            Column(
              children: [
                Center(
                  child: Text(
                    "HASSLE FREE\nQUALITY SERVICE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.withOpacity(.4),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    "v 1.0",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.withOpacity(.4),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Container _nav({
    required int currentIndex,
    required void Function(int) onTap,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(navs.length, (i) {
          bool selected = currentIndex == i;
          return GestureDetector(
            onTap: () {
              onTap(i);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  navs[i]["icon"],
                  color: selected ? Colors.black : Colors.grey,
                ),
                SizedBox(height: 5.h),
                Text(
                  navs[i]["title"],
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: selected ? Colors.black : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Column _measures({required List measures}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(measures.length, (i) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.h),

          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(measures[i]["icon"], height: 55.h),
              ),
              SizedBox(width: 20.w),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      measures[i]["title"],
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      measures[i]["subtitle"],
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Container _band() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black),
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: Text(
        "Best-in Class Safety Measures",
        style: TextStyle(
          fontSize: 20.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Container _benefits({
    required String title,
    required List benefits,
  }) => Container(
    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(ImagePath.home_shield, height: 25.h),
            SizedBox(width: 10.w),
            Text(
              title,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(benefits.length, (i) {
            return Container(
              margin: EdgeInsets.only(bottom: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(.3)),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(benefits[i]["icon"], height: 55.h),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          benefits[i]["title"],
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          benefits[i]["subtitle"],
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    ),
  );

  Container _badges({required List badges}) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: .5,
        ),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: badges.length,
        itemBuilder: (c, i) {
          return Container(
            margin: EdgeInsets.all(5.w),
            child: Column(
              children: [
                Image.asset(badges[i]["icon"], height: 50.h),
                SizedBox(height: 10.h),
                Text(
                  badges[i]["title"],
                  style: TextStyle(fontSize: 10.sp),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Column _serviceRow({required String title, required List items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            title,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(items.length, (i) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.w),
                    child: Image.asset(
                      items[i]["banner"],
                      height: 85.h,
                      width: 135.w,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    items[i]["title"],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  GridView _categories() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (c, i) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(.2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(categories[i]["icon"], height: 45.sp),
              SizedBox(height: 10.h),
              Text(
                categories[i]["title"],
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
              ),
            ],
          ),
        );
      },
    );
  }

  Container _divider() {
    return Container(
      height: 12.h,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(.1)),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 20.sp),
              SizedBox(width: 10.w),
              Text(
                "Home",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 10.w),
              Icon(Icons.arrow_drop_down_outlined, size: 20.sp),
            ],
          ),
          Text(
            "Inner Circle, Connaught Place, New Delhi, Del...",
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
      ],
    );
  }
}

List categories = [
  {"icon": ImagePath.home_category_1, "title": "Renovation"},
  {"icon": ImagePath.home_category_2, "title": "Handyman"},
  {"icon": ImagePath.home_category_3, "title": "Home shifting"},
  {"icon": ImagePath.home_category_4, "title": "Gardening"},
  {"icon": ImagePath.home_category_5, "title": "Declutter"},
  {"icon": ImagePath.home_category_6, "title": "Painting"},
];

List popularServices = [
  {"banner": ImagePath.home_service_1, "title": "Kitchen Cleaning"},
  {"banner": ImagePath.home_service_4, "title": "Full House Cleaning"},
];

List cleaningServices = [
  {"banner": ImagePath.home_service_3, "title": "Kitchen Cleaning"},
  {"banner": ImagePath.home_service_4, "title": "Sofa Cleaning"},
  {"banner": ImagePath.home_service_1, "title": "Full House Cleaning"},
];

List badges = [
  {"icon": ImagePath.home_badge_1, "title": "On Demand/Scheduled"},
  {"icon": ImagePath.home_badge_2, "title": "Verified Partners"},
  {"icon": ImagePath.home_badge_3, "title": "Satisfaction Guarantee"},
  {"icon": ImagePath.home_badge_4, "title": "Upfront Pricing"},
  {"icon": ImagePath.home_badge_4, "title": "Highly Trained Professionals"},
];

List benefits = [
  {
    "icon": ImagePath.home_benefit_1,
    "title": "Quality Assurance",
    "subtitle": "Your satisfaction is guaranteed",
  },
  {
    "icon": ImagePath.home_benefit_2,
    "title": "Fixed Prices",
    "subtitle":
        "No hidden costs, all the prices are known and fixed before booking",
  },
  {
    "icon": ImagePath.home_benefit_3,
    "title": "Hassel free",
    "subtitle": "convenient, time saving and secure",
  },
];

List measures = [
  {
    "icon": ImagePath.home_measure_1,
    "title": "Usage of masks, gloves & Sanitisers",
    "subtitle":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictumst nullam mauris malesuada in. Eget in condimentum porttitor nec tristique penatibus ipsum nunc. ",
  },
  {
    "icon": ImagePath.home_measure_2,
    "title": "Low-contact Service Experience",
    "subtitle":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictumst nullam mauris malesuada in. Eget in condimentum porttitor nec tristique penatibus ipsum nunc. ",
  },
];

List navs = [
  {"icon": ImagePath.home_nav_1, "title": "Home"},
  {"icon": ImagePath.home_nav_2, "title": "Rewards"},
  {"icon": ImagePath.home_nav_3, "title": "My Orders"},
  {"icon": ImagePath.home_nav_4, "title": "Bookings"},
  {"icon": ImagePath.home_nav_5, "title": "Profile"},
];
