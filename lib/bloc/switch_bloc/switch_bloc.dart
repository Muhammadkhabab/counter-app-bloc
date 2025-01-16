import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableOrDisableNotifications>(_switchOnOff);
    on<SliderEvent>(_slider);
  }

  void _switchOnOff(EnableOrDisableNotifications event, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent event, Emitter<SwitchStates> emit) {
    emit(state.copyWith(sliderValue: event.slider));
  }
}
