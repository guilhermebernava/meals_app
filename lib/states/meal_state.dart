import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/enums/meal_type.dart';
import 'package:meals_app/models/meal_state_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/meal.dart';

class MealState extends Cubit<MealStateModel> {
  MealState(MealStateModel stateModel) : super(stateModel);

  void add(MealModel model) {
    state.meals.add(model);
    emit(state);
  }

  void updateMealType(MealType mealType) async {
    final instance = await SharedPreferences.getInstance();
    switch (mealType) {
      case MealType.isGlutenFree:
        state.isGlutenFree = !state.isGlutenFree;
        instance.setString(MealStateModel.keySharedPrefences, state.toJson());
        emit(state);
        break;
      case MealType.isLactoseFree:
        state.isLactoseFree = !state.isLactoseFree;
        instance.setString(MealStateModel.keySharedPrefences, state.toJson());
        emit(state);
        break;
      case MealType.isVegan:
        state.isVegan = !state.isVegan;
        instance.setString(MealStateModel.keySharedPrefences, state.toJson());
        emit(state);
        break;
      case MealType.isVegetarian:
        state.isVegetarian = !state.isVegetarian;
        instance.setString(MealStateModel.keySharedPrefences, state.toJson());
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

      var result = <MealModel>[];
      for (var element in categoryList) {
        if (result.where((item) => item.id == element.id).isNotEmpty) {
          continue;
        }
        result.add(element);
      }

      return result;
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

      var result = <MealModel>[];
      for (var element in categoryList) {
        if (result.where((item) => item.id == element.id).isNotEmpty) {
          continue;
        }
        result.add(element);
      }

      return result.length;
    }
    return 0;
  }
}
