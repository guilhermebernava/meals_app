import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';

class CategoryState extends Cubit<List<CategoryModel>> {
  CategoryState() : super(DummyData.dummyCategories);

  void add(CategoryModel model) {
    state.add(model);
    emit(state);
  }

  void remove(String id) {
    state.removeWhere((_) => _.id == id);
    emit(state);
  }

  void addFavoriteCategory(String id) {
    var isLiked = state.firstWhere((element) => element.id == id).isLiked;
    state.firstWhere((element) => element.id == id).isLiked = !isLiked;
    emit(state);
  }

  bool isLiked(String id) =>
      state.firstWhere((element) => element.id == id).isLiked;

  List<CategoryModel> favorites() =>
      state.where((element) => element.isLiked).toList();
}
