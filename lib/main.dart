import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/view/screens/homePage/bloc/home_bloc.dart';
import 'package:ulearning_app/view/screens/homePage/homePage.dart';
import 'package:ulearning_app/view/screens/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/view/screens/welcome/welcome.dart';

import 'routes/app_router.dart';
import 'common/values/bloc_observer.dart';

late String initialRoute;

void main() async {
  await Global.init();

  initialRoute = Global.initPage();

  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => HomePageBloc(),
        )

      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black)),
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
