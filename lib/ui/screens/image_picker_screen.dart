import 'dart:io';

import 'package:bloc_counter_app/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:bloc_counter_app/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:bloc_counter_app/bloc/image_picker_bloc/image_picker_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image Picker Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
              builder: (context, state) {
                if (state.file == null) {
                  return CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.camera),
                  );
                } else if (state.sourceType == ImageSourceType.camera) {
                  return CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    backgroundImage: FileImage(File(state.file!.path)),
                    child: Icon(Icons.camera_alt, size: 40, color: Colors.white54),
                  );
                } else if (state.sourceType == ImageSourceType.gallery) {
                  return CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    backgroundImage: FileImage(File(state.file!.path)),
                    child: Icon(Icons.photo, size: 40, color: Colors.white54),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'camera',
                onPressed: () {
                  context.read<ImagePickerBloc>().add(CameraCaptureEvent());
                },
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              FloatingActionButton(
                heroTag: 'gallery',
                onPressed: () {
                  context.read<ImagePickerBloc>().add(GalleryPickerEvent());
                },
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.image_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
