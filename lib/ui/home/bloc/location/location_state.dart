part of 'location_bloc.dart';

@immutable
abstract class LocationState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetLocationState extends LocationState {
  final String locationValue;

  GetLocationState(this.locationValue) : assert(locationValue != null);

  @override
  List<Object> get props => [locationValue];
}

class GetLocationLoading extends LocationState {}
class GetLocationError extends LocationState {}

class GetLocationError extends LocationState {}
