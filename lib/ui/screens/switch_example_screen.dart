import 'package:bloc_counter_app/bloc/switch_bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    print('Notification');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Switch Example',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Notification'),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwitch,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(EnableOrDisableNotifications());
                      },
                    );
                  },
                )
              ],
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown.withValues(alpha: state.sliderValue), width: 3),
                    color: Colors.red.withValues(alpha: state.sliderValue),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Slider(
                  value: state.sliderValue,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
