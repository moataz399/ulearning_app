part of 'home_bloc.dart';

@immutable
abstract class HomePageEvent {
  HomePageEvent();
}

class HomePageDots extends HomePageEvent {
  final int index;

  HomePageDots(this.index);
}
