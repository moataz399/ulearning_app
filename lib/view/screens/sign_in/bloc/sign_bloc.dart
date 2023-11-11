import 'package:bloc/bloc.dart';
import 'package:ulearning_app/view/screens/sign_in/bloc/sign_event.dart';

part 'sign_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {




    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}
