import 'dart:developer';
import 'package:bloc_counter_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter_app/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_bloc/counter_event.dart';

class CounterHomeScreen extends StatefulWidget {
  const CounterHomeScreen({super.key});

  @override
  State<CounterHomeScreen> createState() => _CounterHomeScreenState();
}

class _CounterHomeScreenState extends State<CounterHomeScreen> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _counterBloc = CounterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Counter App',
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
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, bloc) {
                log('build text');
                return Text(
                  bloc.counter.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 40),
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, bloc) {
                    log('build');
                    return ElevatedButton(
                      onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
                      child: Text('Increment Number'),
                    );
                  },
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, bloc) {
                    return ElevatedButton(
                      onPressed: () => context.read<CounterBloc>().add(DecrementCounter()),
                      child: Text('Increment Number'),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
