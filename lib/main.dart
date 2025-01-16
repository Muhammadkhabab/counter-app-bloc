import 'package:bloc_counter_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter_app/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:bloc_counter_app/ui/screens/counter_home_screen.dart';
import 'package:bloc_counter_app/ui/screens/home_screen.dart';
import 'package:bloc_counter_app/utlis/image_picker_utlis/image_picker_utlis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/switch_bloc/switch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtlis())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Counter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
