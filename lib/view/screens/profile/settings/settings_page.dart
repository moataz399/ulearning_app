import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/routes/names.dart';
import 'package:ulearning_app/view/screens/application_page/app_bloc.dart';
import 'package:ulearning_app/view/screens/application_page/app_event.dart';
import 'package:ulearning_app/view/screens/profile/settings/settings_bloc.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Global.storageService
                        .remove(AppConstants.STORAGE_USER_TOKEN_KEY);
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(signInPage, (route) => false);
                    context.read<AppBloc>().add(TriggerAppEvent(0));
                  },
                  child: Container(
                    height: 100.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icons/Logout.png'))),
                  ),
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}
