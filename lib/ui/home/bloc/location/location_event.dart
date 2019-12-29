part of 'location_bloc.dart';

@immutable
abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class GetLocationEvent extends LocationEvent {
  const GetLocationEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
