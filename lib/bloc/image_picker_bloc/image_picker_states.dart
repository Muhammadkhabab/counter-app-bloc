import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSourceType { camera, gallery}

class ImagePickerStates extends Equatable {
  final XFile? file;
  final ImageSourceType? sourceType;

  const ImagePickerStates({this.file, this.sourceType});

  ImagePickerStates copyWith({XFile? file, ImageSourceType? sourceType}) {
    return ImagePickerStates(
      file: file ?? this.file,
      sourceType: sourceType ?? this.sourceType,
    );
  }

  @override
  List<Object?> get props => [file, sourceType];
}
