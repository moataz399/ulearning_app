import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/routes/names.dart';

import '../../widgets/flutter_toast.dart';
import 'bloc/sign_bloc.dart';

class SignInController {
  final BuildContext context;

  ///context for dealing with Bloc
  SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        ///BlocProvider.of<SignBloc>().state; the same thing as below

        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: 'you need to enter your email address');
          return;
        } else {
          print('email is $emailAddress');
        }
        if (password.isEmpty) {
          toastInfo(msg: 'you need to enter your password ');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credential.user == null) {
            toastInfo(msg: "this email don't exist  ");
            return;
          }

          ///user is not verified
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'you need to verify your email account');
            return;
          }
          var user = credential.user;
          if (user != null) {
            Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY,
                '123456789 is a dummy value ');

            ///we got verified user from firebase
            print('user exist ');
            Navigator.of(context)
                .pushNamedAndRemoveUntil(appPage, (route) => false);
          } else {
            ///we have error getting user from firebase
            toastInfo(msg: 'Currently you are not a user of this app ');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'no user found for that email');
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'your email format is wrong');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user');
          } else if (e.code == 'user-disabled') {
            toastInfo(msg: 'this user is disabled ');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
