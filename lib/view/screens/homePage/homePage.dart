import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/view/screens/homePage/bloc/home_bloc.dart';
import 'package:ulearning_app/view/screens/homePage/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: homePageText(
                      'Hello',
                      color: AppColors.primaryThirdElementText,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: homePageText('moataz', top: 5),
                  ),
                  SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                  SliverToBoxAdapter(
                    child: searchView(),
                  ),
                  SliverToBoxAdapter(
                    child: sliderView(context, state),
                  ),
                  SliverToBoxAdapter(
                    child: menuView(),
                  ),
                  SliverPadding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                      sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(childCount: 4,
                              (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: courseGrid(),
                            );
                          }),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 1.6,
                                  crossAxisSpacing: 15,
                                  crossAxisCount: 2))),
                ],
              )),
        );
      },
    );
  }
}
