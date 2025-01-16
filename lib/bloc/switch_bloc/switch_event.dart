part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();
  @override
  List<Object?> get props => [];
}

//this is the sub class off the switch event
class EnableOrDisableNotifications extends SwitchEvent {}

//this is the slider event
class SliderEvent extends SwitchEvent {
  final double slider;
  const SliderEvent({required this.slider});

  @override
  List<Object?> get props => [slider];
}
