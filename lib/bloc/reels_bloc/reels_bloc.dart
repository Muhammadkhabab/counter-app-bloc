import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/bloc/reels_bloc/reels_event.dart';
import 'package:bloc_counter_app/bloc/reels_bloc/reels_states.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  ReelsBloc()
      : super(
          ReelsState(
            videoList: List.generate(10, (index) => 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
            likes: {},
            comments: {},
          ),
        ) {
    on<LikeVideo>(_onLikeVideo);
    on<AddComment>(_onAddComment);
  }

  void _onLikeVideo(LikeVideo event, Emitter<ReelsState> emit) {
    final currentLikes = state.likes[event.videoIndex] ?? 0;
    final updatedLikes = Map<int, int>.from(state.likes)..[event.videoIndex] = currentLikes + 1;
    emit(state.copyWith(likes: updatedLikes));
  }

  void _onAddComment(AddComment event, Emitter<ReelsState> emit) {
    Map<int, List<String>> comments = {};
    int videoIndex = 1;
    List<String> currentComments = comments[videoIndex] ?? [];
    currentComments.add('New comment');
    comments[videoIndex] = currentComments;
  }
}
