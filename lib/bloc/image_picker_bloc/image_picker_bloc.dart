import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../utlis/image_picker_utlis/image_picker_utlis.dart';
import 'image_picker_event.dart';
import 'image_picker_states.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtlis imagePickerUtlis;
  ImagePickerBloc(this.imagePickerUtlis) : super(ImagePickerStates()) {
    on<CameraCaptureEvent>(_cameraCapture);
    on<GalleryPickerEvent>(_galleryPicker);
  }

  void _cameraCapture(CameraCaptureEvent event, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtlis.cameraCapture();
    emit(state.copyWith(file: file, sourceType: ImageSourceType.camera));
  }

  void _galleryPicker(GalleryPickerEvent event, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtlis.galleryPicker();
    emit(state.copyWith(file: file, sourceType: ImageSourceType.gallery));
  }
}
