import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/routes/names.dart';
import 'package:ulearning_app/view/screens/sign_in/bloc/sign_event.dart';
import 'package:ulearning_app/view/screens/sign_in/signIn_controller.dart';
import 'package:ulearning_app/view/widgets/widgets.dart';

import 'bloc/sign_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Log In', true),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                        child: reusableText(
                            'or use your email account to log in')),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(right: 25.w, left: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('email'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              'user', 'enter your email address', 'email',
                              (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText('password'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              'lock', 'enter your password', 'password',
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          }),
                          buildForgetPassword(),
                          SizedBox(height: 70.h),
                          buildLoginAndRegButton('Log in', "login", () {
                            SignInController(context: context)
                                .handleSignIn('email');
                          }),
                          buildLoginAndRegButton('Register', 'register', () {
                            Navigator.of(context).pushNamed(registerPage);
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
