import 'package:bloc_counter_app/reels/reels..dart';
import 'package:bloc_counter_app/ui/screens/counter_home_screen.dart';
import 'package:bloc_counter_app/ui/screens/switch_example_screen.dart';
import 'package:bloc_counter_app/ui/screens/todo_screen.dart';
import 'package:flutter/material.dart';

import 'image_picker_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //todo: favorrite app must to impment through bloc model repsotiroy
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 30,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CounterHomeScreen()));
                },
                child: Text('Counter Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePickerScreen()));
                },
                child: Text('Image Picker Screen'),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SwitchExampleScreen()));
                },
                child: Text('Switch Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReelsApp()));
                },
                child: Text('Reels'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TodoScreen()));
                },
                child: Text('To do Screen'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
