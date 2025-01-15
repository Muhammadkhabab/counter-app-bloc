import 'package:equatable/equatable.dart';

//this is the abstract class for the counter
abstract class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object?> get props => [];
}

//this is the abstract sub class
class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}
