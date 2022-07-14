import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/enums/meal_type.dart';
import 'package:meals_app/models/meal_state_model.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class MealState extends Cubit<MealStateModel> {
  MealState()
      : super(
          MealStateModel(
            DummyData.dummyMeals,
            false,
            false,
            false,
            false,
          ),
        );

  void add(MealModel model) {
    state.meals.add(model);
    emit(state);
  }

  void updateMealType(MealType mealType) {
    switch (mealType) {
      case MealType.isGlutenFree:
        state.isGlutenFree = !state.isGlutenFree;
        emit(state);
        break;
      case MealType.isLactoseFree:
        state.isLactoseFree = !state.isLactoseFree;
        emit(state);
        break;
      case MealType.isVegan:
        state.isVegan = !state.isVegan;
        emit(state);
        break;
      case MealType.isVegetarian:
        state.isVegetarian = !state.isVegetarian;
        emit(state);
        break;
    }
  }

  void remove(String id) {
    state.meals.removeWhere((_) => _.id == id);
    emit(state);
  }

  List<MealModel> byCategory(String categoryId) {
    if (!state.isGlutenFree &&
        !state.isLactoseFree &&
        !state.isVegan &&
        !state.isVegetarian) {
      return state.meals
          .where((element) => element.categories.contains(categoryId))
          .toList();
    }

    if (state.isGlutenFree ||
        state.isLactoseFree ||
        state.isVegan ||
        state.isVegetarian) {
      var finalList = <MealModel>[];

      if (state.isGlutenFree) {
        finalList.addAll(state.meals.where((element) =>
            element.categories.contains(categoryId) &&
            element.isGlutenFree == state.isGlutenFree));
      }

      if (state.isLactoseFree) {
        finalList.addAll(state.meals.where((element) =>
            element.categories.contains(categoryId) &&
            element.isGlutenFree == state.isLactoseFree));
      }

      if (state.isVegan) {
        finalList.addAll(state.meals.where((element) =>
            element.categories.contains(categoryId) &&
            element.isGlutenFree == state.isVegan));
      }

      if (state.isVegetarian) {
        finalList.addAll(state.meals.where((element) =>
            element.categories.contains(categoryId) &&
            element.isGlutenFree == state.isVegetarian));
      }

      var categoryList = finalList
          .where((element) => element.categories.contains(categoryId))
          .toList();

      return categoryList;
    }
    return [];
  }

  int lenght(String categoryId) {
    if (!state.isGlutenFree &&
        !state.isLactoseFree &&
        !state.isVegan &&
        !state.isVegetarian) {
      return state.meals
          .where((element) => element.categories.contains(categoryId))
          .toList()
          .length;
    }

    if (state.isGlutenFree ||
        state.isLactoseFree ||
        state.isVegan ||
        state.isVegetarian) {
      var finalList = <MealModel>[];

      if (state.isGlutenFree) {
        finalList.addAll(state.meals.where((element) =>
            element.categories.contains(categoryId) &&
            element.isGlutenFree == state.isGlutenFree));
      }

      if (state.isLactoseFree) {
        finalList.addAll(state.meals.where((element) =>
            element.categories.contains(categoryId) &&
            element.isGlutenFree == state.isLactoseFree));
      }

      if (state.isVegan) {
        finalList.addAll(state.meals.where((element) =>
            element.categories.contains(categoryId) &&
            element.isGlutenFree == state.isVegan));
      }

      if (state.isVegetarian) {
        finalList.addAll(state.meals.where((element) =>
            element.categories.contains(categoryId) &&
            element.isGlutenFree == state.isVegetarian));
      }

      var categoryList = finalList
          .where((element) => element.categories.contains(categoryId))
          .toList();

      return categoryList.length;
    }
    return 0;
  }
}
