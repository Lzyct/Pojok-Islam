import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
