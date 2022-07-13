import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal_state_model.dart';
import 'package:meals_app/states/category_state.dart';
import 'package:meals_app/states/meal_state.dart';
import 'package:meals_app/widgets/meal_item/meal_item.dart';

class Category extends StatelessWidget {
  static const route = "/recipe";

  final String recipeTitle;
  final String id;
  const Category({Key? key, required this.recipeTitle, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipeTitle),
      ),
      body: BlocBuilder<CategoryState, List<CategoryModel>>(
        builder: (context, categories) => ListView.builder(
          itemBuilder: (context, index) {
            return BlocBuilder<MealState, MealStateModel>(
              builder: (ctx, meals) =>
                  context.read<MealState>().byCategory(id).isEmpty
                      ? Container()
                      : MealItem(
                          context,
                          model: context
                              .read<MealState>()
                              .byCategory(id)
                              .elementAt(index),
                          size: size,
                        ),
            );
          },
          itemCount: context.read<MealState>().lenght(id),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        tooltip: "Delete this category",
        child: const Icon(
          Icons.delete,
          size: 30,
        ),
        onPressed: () {
          context.read<CategoryState>().remove(id);
          Navigator.of(context).pushReplacementNamed("/");
        },
      ),
    );
  }
}
