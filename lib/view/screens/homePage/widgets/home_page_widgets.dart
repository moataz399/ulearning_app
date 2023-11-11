import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/view/screens/homePage/bloc/home_bloc.dart';

import '../../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/icons/person.png'),
              )),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color? color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(text,
        style: TextStyle(
          fontSize: 24.sp,
          color: color,
          fontWeight: FontWeight.bold,
        )),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          border: Border.all(color: AppColors.primaryFourthElementText),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.h,
              child: Image.asset('assets/icons/search.png'),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.search,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Avenir',
                  fontSize: 14.sp,
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: 'search your course',
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      SizedBox(
        width: 5.w,
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.w),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      ),
    ],
  );
}

Widget sliderView(BuildContext context, HomePageState state) {
  return Container(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 325.w,
          height: 160.h,
          child: PageView(
            onPageChanged: (value) {
              context.read<HomePageBloc>().add(HomePageDots(value));
            },
            children: [
              sliderContainer(path: 'assets/icons/Art.png'),
              sliderContainer(path: 'assets/icons/Image(1).png'),
              sliderContainer(path: 'assets/icons/Image(2).png'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          child: DotsIndicator(
            dotsCount: 3,
            position: state.index,
            decorator: DotsDecorator(
              color: AppColors.primaryThirdElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        )
      ],
    ),
  );
}

Widget sliderContainer({String path = 'assets/icons/Art.png'}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.h),
        ),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText('choose your course',
                color: AppColors.primaryText, fontSize: 16),
            GestureDetector(
                child: reusableText('see all',
                    color: AppColors.primaryThirdElementText, fontSize: 10))
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            reusableMenuButton('all'),
            reusableMenuButton('popular',
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: Colors.white),
            reusableMenuButton('newest',
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: Colors.white),
          ],
        ),
      )
    ],
  );
}

Widget reusableText(String text,
    {Color color = AppColors.primaryText,
    int fontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
      child: Text(
    text,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      color: color,
    ),
  ));
}

Widget reusableMenuButton(String text,
    {Color textColor = AppColors.primaryElementText,
    Color backGroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    decoration: BoxDecoration(
      color: backGroundColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: backGroundColor),
    ),
    child: reusableText(text,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 11),
  );
}

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/icons/Image(1).png',
            ))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Best course for IT',
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryElementText,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'flutter best course',
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.primaryFourthElementText,
          ),
        ),
      ],
    ),
  );
}
