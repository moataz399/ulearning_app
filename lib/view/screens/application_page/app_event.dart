
abstract class AppEvent {}





class TriggerAppEvent extends AppEvent {

  final int index;

  TriggerAppEvent(this.index);
}