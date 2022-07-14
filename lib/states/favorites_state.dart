import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/favorites_model_state.dart';
import 'package:meals_app/themes/app_colors.dart';

class FavoritesState extends Cubit<FavoriteModelState> {
  FavoritesState()
      : super(
          FavoriteModelState(
            DummyData.dummyCategories
                .where((element) => element.isLiked)
                .toList(),
          ),
        );

  void likeCategory(CategoryModel model) {
    var exist = state.categories.firstWhere((element) => element.id == model.id,
        orElse: (() => CategoryModel(
            color: AppColors.background, title: "EMPTY", id: "-10")));

    if (exist.title == "EMPTY") {
      model.isLiked = true;
      state.categories.add(model);
    } else {
      model.isLiked = false;
      state.categories.remove(model);
    }

    emit(state);
  }

  void removeCategory(String id) {
    state.categories.removeWhere((_) => _.id == id);
    emit(state);
  }

  bool isLikedCategory(String id) {
    var result = state.categories.firstWhere((element) => element.id == id,
        orElse: () =>
            CategoryModel(id: id, title: "EMPTY", color: AppColors.background));

    if (result.title == "EMPTY") {
      return false;
    }
    return result.isLiked;
  }
}
