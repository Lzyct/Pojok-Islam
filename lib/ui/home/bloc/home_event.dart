part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetLocationEvent extends HomeEvent {
  const GetLocationEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
