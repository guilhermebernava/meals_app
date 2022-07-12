import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class MealState extends Cubit<List<MealModel>> {
  MealState() : super(DummyData.dummyMeals);

  void add(MealModel model) {
    state.add(model);
    emit(state);
  }

  void remove(String id) {
    state.removeWhere((_) => _.id == id);
    emit(state);
  }

  List<MealModel> byCategory(String categoryId) {
    return state
        .where((element) => element.categories.contains(categoryId))
        .toList();
  }

  int lenght(String categoryId) {
    return state
        .where((element) => element.categories.contains(categoryId))
        .toList()
        .length;
  }
}
