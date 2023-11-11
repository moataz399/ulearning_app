import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/view/screens/register/sign_up_bloc.dart';

import '../../widgets/flutter_toast.dart';

class SignUpController {
  final BuildContext context;

  ///context for dealing with Bloc
  SignUpController({required this.context});

  void handleEmailSignUp() async {
    final state = context.read<SignUpBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (userName.isEmpty) {
      toastInfo(msg: 'user name can not be empty');
      return;
    } else {
      print('user name is $userName');
    }
    if (email.isEmpty) {
      toastInfo(msg: 'you need to enter email address');
      return;
    } else {
      print('email is $email');
    }
    if (password.isEmpty) {
      toastInfo(msg: 'you need to enter password ');
      return;
    }
    if (confirmPassword.isEmpty) {
      toastInfo(msg: 'your password confirmation is wrong ');
    }
    if (password != confirmPassword) {
      toastInfo(msg: 'passwords do not match');
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      //  var user = credential.user;

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                'an email has been send to your registered email to activate it check your email box and click on the link ');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'your password is weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'the email is already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'your email id is invalid');
      }
    }
  }
}
