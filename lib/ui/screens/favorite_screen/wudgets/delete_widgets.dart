import 'package:bloc_counter_app/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:bloc_counter_app/bloc/favorite_bloc/favorite_events.dart';
import 'package:bloc_counter_app/bloc/favorite_bloc/favorite_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteWidgets extends StatelessWidget {
  const DeleteWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      buildWhen: (previous, current) => previous.temporaryList != current.temporaryList,
      builder: (context, state) {
        return Visibility(
          visible: state.temporaryList.isNotEmpty ? true : false,
          child: IconButton(
            onPressed: () {
              context.read<FavoriteBloc>().add(DeleteItem());
            },
            icon: Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
