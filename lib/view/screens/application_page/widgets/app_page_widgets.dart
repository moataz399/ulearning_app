import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/routes/names.dart';
import 'package:ulearning_app/view/screens/profile/profile_page.dart';

import '../../../../common/values/colors.dart';
import '../../homePage/homePage.dart';






Widget buildPage({required int index}) {
  List widgets =  [
  const HomePage(),
    Center(
      child: Text('search'),
    ),
    Center(
      child: Text('play'),
    ),
    Center(
      child: Text('chat'),
    ),
   ProfilePage(),
  ];
  return widgets[index];
}




var bottomTabs=[
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.w,
      width: 15.h,
      child: Image.asset('assets/icons/home.png'),
    ),
    label: 'Home',
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        'assets/icons/home.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset('assets/icons/search2.png'),
    ),
    label: 'assets/icons/search.png',
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        'assets/icons/search2.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset('assets/icons/play-circle1.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        'assets/icons/play-circle1.png',
        color: AppColors.primaryElement,
      ),
    ),
    label: 'play',
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset('assets/icons/message-circle.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        'assets/icons/message-circle.png',
        color: AppColors.primaryElement,
      ),
    ),
    label: 'chat',
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.w,
      width: 15.w,
      child: Image.asset('assets/icons/person.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        'assets/icons/person.png',
        color: AppColors.primaryElement,
      ),
    ),
    label: 'profile',
  ),
];