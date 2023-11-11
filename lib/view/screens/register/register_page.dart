import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/view/screens/register/signUp_Controller.dart';
import 'package:ulearning_app/view/screens/register/sign_up_bloc.dart';

import '../../widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Sign Up', true),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: reusableText(
                            'Enter your details below & free sign up')),
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      padding: EdgeInsets.only(right: 25.w, left: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('User name'),
                          buildTextField(
                              'user', 'Enter your user name', 'user name',
                              (value) {
                            context
                                .read<SignUpBloc>()
                                .add(UserNameEvent(value));
                          }),
                          reusableText('Email'),
                          buildTextField('user', 'Enter your Email address',
                              'Email address', (value) {
                            context.read<SignUpBloc>().add(EmailEvent(value));
                          }),
                          reusableText('password'),
                          buildTextField(
                              'lock', 'Enter your password', 'password',
                              (value) {
                            context
                                .read<SignUpBloc>()
                                .add(PasswordEvent(value));
                          }),
                          reusableText('Confirm password'),
                          buildTextField(
                              'lock', 'Confirm your password', 'password',
                              (value) {
                            context
                                .read<SignUpBloc>()
                                .add(ConfirmPasswordEvent(value));
                          }),
                          reusableText(
                              'by creating an account you have to agree with our terms and conditions'),
                          buildSignUpButton('SignUp', 'signUp', () {
                            SignUpController(context: context)
                                .handleEmailSignUp();
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
