import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/view/screens/application_page/app_bloc.dart';
import 'package:ulearning_app/view/screens/application_page/application_page.dart';
import 'package:ulearning_app/view/screens/homePage/homePage.dart';
import 'package:ulearning_app/view/screens/profile/profile_page.dart';
import 'package:ulearning_app/view/screens/profile/settings/settings_bloc.dart';
import 'package:ulearning_app/view/screens/profile/settings/settings_page.dart';
import 'package:ulearning_app/view/screens/register/register_page.dart';
import 'package:ulearning_app/view/screens/register/sign_up_bloc.dart';
import 'package:ulearning_app/view/screens/sign_in/bloc/sign_bloc.dart';
import 'package:ulearning_app/view/screens/sign_in/signIn_page.dart';
import 'package:ulearning_app/view/screens/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/view/screens/welcome/welcome.dart';

import '../view/screens/homePage/bloc/home_bloc.dart';
import 'names.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => WelcomeBloc(),
                  child: const WelcomePage(),
                ));

      case signInPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SignInBloc(),
                  lazy: false,
                  child: const SignInPage(),
                ));

      case homePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomePageBloc(),
                  child: HomePage(),
                ));

      case registerPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SignUpBloc(),
                  child: const RegisterPage(),
                ));
      case appPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AppBloc(),
                  child: const ApplicationPage(),
                ));

      case profilePage:
        return MaterialPageRoute(builder: (_) => const ProfilePage());

      case settingsPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => SettingsBloc(),
              child: SettingsPage(),
            ));
    }




    return null;
  }
}
