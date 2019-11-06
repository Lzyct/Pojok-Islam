import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable{}

class InitialHomeState extends HomeState{
  @override
  List<Object> get props => [];
}

class GetLocationState extends HomeState{
  final String locationValue;

  GetLocationState(this.locationValue): assert(locationValue!= null);

  @override
  List<Object> get props => [locationValue];
}
