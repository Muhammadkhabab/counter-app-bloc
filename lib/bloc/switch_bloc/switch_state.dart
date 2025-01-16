part of 'switch_bloc.dart';

class SwitchStates extends Equatable {
  final bool isSwitch;
  double sliderValue;
  SwitchStates({this.isSwitch = false, this.sliderValue = 1.0});

  //create the new instance of the SwitchState
  SwitchStates copyWith({bool? isSwitch, double? sliderValue}) {
    return SwitchStates(
      isSwitch: isSwitch ?? this.isSwitch,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  List<Object?> get props => [isSwitch, sliderValue];
}
