
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';


part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super( const SignUpState()) {
    on<UserNameEvent>((event, emit) {
      emit(state.copyWith(userName: event.userName));
    });
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<ConfirmPasswordEvent>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });
  }
}
