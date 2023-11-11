import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/view/screens/application_page/app_bloc.dart';
import 'package:ulearning_app/view/screens/application_page/app_event.dart';
import 'package:ulearning_app/view/screens/application_page/app_state.dart';
import 'package:ulearning_app/view/screens/application_page/widgets/app_page_widgets.dart';

import '../../../common/values/colors.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  final int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
                body: buildPage(index: state.index),
                bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: AppColors.primaryElement,
                    currentIndex: state.index,
                    type: BottomNavigationBarType.fixed,
                    unselectedItemColor: AppColors.primaryFourthElementText,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0,
                    onTap: (value) {
                      context.read<AppBloc>().add(TriggerAppEvent(value));
                    },
                    items: bottomTabs)),
          ),
        );
      },
    );
  }
}
