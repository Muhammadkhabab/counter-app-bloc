import 'package:equatable/equatable.dart';

class ReelsState extends Equatable {
  final List<String> videoList;
  final Map<int, int> likes;
  final Map<int, List<String>> comments;

  const ReelsState({required this.videoList, required this.likes, required this.comments});

  //this is the copy method for the reels
  ReelsState copyWith({
    List<String>? videoList,
    Map<int, int>? likes,
    Map<int, List<String>>? comments,
  }) {
    return ReelsState(
      videoList: videoList ?? this.videoList,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
    );
  }

  @override
  List<Object?> get props => [videoList, likes, comments];
}
