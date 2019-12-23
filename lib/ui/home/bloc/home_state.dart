part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class InitialHomeState extends HomeState {
  @override
  List<Object> get props => [];
}

class GetLocationState extends HomeState {
  final String locationValue;

  GetLocationState(this.locationValue) : assert(locationValue != null);

  @override
  List<Object> get props => [locationValue];
}
