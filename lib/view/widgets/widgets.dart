import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

///build appbar

AppBar buildAppBar(String title, bool centerTitle) {
  return AppBar(
    elevation: .5,
    title: Text(
      title,
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
    centerTitle: centerTitle,
    backgroundColor: Colors.white,
  );
}

/// context for using bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 50.h),
    padding: EdgeInsets.only(left: 50.w, right: 50.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        reusableIcon('google'),
        reusableIcon('apple'),
        reusableIcon('facebook'),
      ],
    ),
  );
}

Widget reusableIcon(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildTextField(String iconName, String hintText, String textType,
    void Function(String value) func) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.primaryFourthElementText),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            textInputAction: TextInputAction.done,
            onChanged: (value) => func(value),
            obscureText: textType == 'password' ? true : false,
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
              fontFamily: 'Avenir',
              fontSize: 14.sp,
            ),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
            autocorrect: false,
          ),
        )
      ],
    ),
  );
}

Widget buildForgetPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    margin: EdgeInsets.only(left: 15.w),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'forgot password',
        style: TextStyle(
          fontSize: 12.sp,
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
        ),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(
    String textButtonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: buttonType == 'login' ? 40.h : 20.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: buttonType == 'login'
              ? Colors.transparent
              : AppColors.primaryFourthElementText,
        ),
        color: buttonType == 'login'
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          textButtonName,
          style: TextStyle(
            color: buttonType == 'login'
                ? AppColors.primaryBackground
                : AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
  );
}

Widget buildSignUpButton(
    String textButtonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(top: buttonType == 'signUp' ? 20.h : 20.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: buttonType == 'signUp'
              ? Colors.transparent
              : AppColors.primaryFourthElementText,
        ),
        color: buttonType == 'signUp'
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          textButtonName,
          style: TextStyle(
            color: buttonType == 'signUp'
                ? AppColors.primaryBackground
                : AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
  );
}
