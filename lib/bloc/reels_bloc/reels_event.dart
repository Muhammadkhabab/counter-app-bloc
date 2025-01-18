import 'package:equatable/equatable.dart';

abstract class ReelsEvent extends Equatable {
  ReelsEvent();

  @override
  List<Object> get props => [];
}

class LikeVideo extends ReelsEvent {
  final int videoIndex;
  LikeVideo(this.videoIndex);

  @override
  List<Object> get props => [videoIndex];
}

class AddComment extends ReelsEvent {
  final int videoIndex;
  final String comment;

  AddComment(this.videoIndex, this.comment);

  @override
  List<Object> get props => [videoIndex, comment];
}
