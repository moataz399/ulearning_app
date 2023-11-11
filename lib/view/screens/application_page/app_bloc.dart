
import 'package:bloc/bloc.dart';
import 'package:ulearning_app/view/screens/application_page/app_event.dart';
import 'package:ulearning_app/view/screens/application_page/app_state.dart';



class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<TriggerAppEvent>((event, emit) {
    emit(AppState(index: event.index));
    print(event.index);

    });
  }
}
