import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/routes/names.dart';

AppBar buildProfileAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          Container(
            child: Text(
              'Profile',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset('assets/icons/more-vertical.png'),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    padding: EdgeInsets.only(right: 6.w),
    alignment: Alignment.bottomRight,
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: const DecorationImage(
            image: AssetImage('assets/icons/headpic.png'))),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage('assets/icons/edit_3.png'),
    ),
  );
}

Map imagesInfo = <String, String>{
  'Settings': 'settings.png',
  "Payment details": 'credit-card.png',
  "Achievements": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png",
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
          imagesInfo.length,
          (index) => GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(settingsPage),
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        padding: EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                          color: AppColors.primaryElement,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Image(
                          image: AssetImage(
                              'assets/icons/${imagesInfo.values.elementAt(index)}'),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        child: Text(
                          '${imagesInfo.keys.elementAt(index)}',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
    ],
  );
}
