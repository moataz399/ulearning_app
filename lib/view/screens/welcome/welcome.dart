import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/routes/names.dart';

import '../../../common/values/colors.dart';
import 'bloc/welcome_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
                margin: const EdgeInsets.only(top: 34),
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context)
                            .add(WelcomeEvent());
                      },
                      children: [
                        _page(
                            1,
                            context,
                            'next',
                            "First See Learning ",
                            'Forget about a for of a paper all knowledge in one learning',
                            'assets/images/reading.png'),
                        _page(
                            2,
                            context,
                            'next',
                            "Connect With Everyone  ",
                            "Always keep in touch with your friends let's get connected",
                            'assets/images/boy.png'),
                        _page(
                            3,
                            context,
                            'get started',
                            "Always Fascinated Learning ",
                            'Anywhere ,anytime. The time is at our discretion so study whenever you want.   ',
                            'assets/images/man.png'),
                      ],
                    ),
                    Positioned(
                      bottom: 85.h,
                      child: DotsIndicator(
                        position: state.page,
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                          color: AppColors.primaryThirdElementText,
                          activeColor: AppColors.primaryElement,
                          size: const Size.square(8.0),
                          activeSize: const Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text('$title ',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.primaryText,
              )),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          width: 375.w,
          child: Text('$subTitle ',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.primarySecondaryElementText,
              )),
        ),

        ///button
        GestureDetector(
          onTap: () {
            ///animation
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            }

            ///go to another page
            else {
              Global.storageService
                  .setbool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              print(
                  'the value is ${Global.storageService.getDeviceFirstOpen()}');
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(signInPage, (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, right: 25.w, left: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.w),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
