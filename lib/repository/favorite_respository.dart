import 'package:bloc_counter_app/models/favorite_model/favorite_model.dart';

class FavoriteRepository {
  Future<List<FavoriteModel>> fetchItems() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_onGenerateItem(10));
  }

  List<FavoriteModel> _onGenerateItem(int length) {
    return List.generate(
      length,
      (index) => FavoriteModel(
        id: '$index',
        value: 'Item $index',
      ),
    );
  }
}
