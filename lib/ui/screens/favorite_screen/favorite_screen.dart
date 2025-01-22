import 'package:bloc_counter_app/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:bloc_counter_app/bloc/favorite_bloc/favorite_states.dart';
import 'package:bloc_counter_app/models/favorite_model/favorite_model.dart';
import 'package:bloc_counter_app/ui/screens/favorite_screen/wudgets/delete_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/favorite_bloc/favorite_events.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isCollapsed = false;

  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(FetchFavoriteList());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 80 && !_isCollapsed) {
      setState(() => _isCollapsed = true);
    } else if (_scrollController.offset <= 80 && _isCollapsed) {
      setState(() => _isCollapsed = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 160.0,
            floating: true,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final isCollapsed = constraints.biggest.height <= 100.0;
                return FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(left: 16, bottom: isCollapsed ? 16 : 78),
                  title: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: isCollapsed
                        ? Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Expanded(
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search favorites...',
                                      prefixIcon: Icon(Icons.search),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                DeleteWidgets(),
                                SizedBox(width: 10),
                              ],
                            ),
                          )
                        : const Text(
                            'Favorites',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: isCollapsed ? 0 : 50,
                            margin: EdgeInsets.only(
                              bottom: isCollapsed ? 0 : 16,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: isCollapsed
                                ? const SizedBox.shrink()
                                : Row(
                                    children: [
                                      Expanded(
                                        child: const TextField(
                                          decoration: InputDecoration(
                                            hintText: 'Search favorites...',
                                            prefixIcon: Icon(Icons.search),
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      DeleteWidgets(),
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              switch (state.listStatus) {
                case ListStatus.loading:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ListStatus.error:
                  return SliverFillRemaining(
                    child: Center(
                      child: Text('Error loading favorites'),
                    ),
                  );
                case ListStatus.success:
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final favoriteItems = state.favoriteModel[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          elevation: 2,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: Checkbox(
                              value: state.temporaryList.contains(state.favoriteModel[index]) ? true : false,
                              onChanged: (bool? value) {
                                FavoriteModel item = state.favoriteModel[index];
                                if (value!) {
                                  context.read<FavoriteBloc>().add(SelectItem(item: item));
                                } else {
                                  context.read<FavoriteBloc>().add(UnSelectItem(item: item));
                                }
                              },
                            ),
                            title: Text(
                              favoriteItems.value,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                state.favoriteModel[index].isFavorite ? Icons.favorite : Icons.favorite_outline,
                                color: state.favoriteModel[index].isFavorite ? Colors.red : Colors.black,
                              ),
                              onPressed: () {
                                FavoriteModel item = state.favoriteModel[index];
                                context.read<FavoriteBloc>().add(
                                      AddFavorite(
                                        favoriteItem: FavoriteModel(id: item.id, value: item.value, isFavorite: item.isFavorite ? false : true),
                                      ),
                                    );
                              },
                            ),
                          ),
                        );
                      },
                      childCount: state.favoriteModel.length,
                    ),
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
