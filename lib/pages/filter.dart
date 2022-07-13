import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/enums/meal_type.dart';
import 'package:meals_app/states/meal_state.dart';

import '../widgets/select_widget.dart';

class Filter extends StatefulWidget {
  static const route = "/filters";
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  late bool isGluttenFree;
  late bool isVegan;
  late bool isVegetarian;
  late bool isLactoseFree;

  @override
  void initState() {
    isGluttenFree = context.read<MealState>().state.isGlutenFree;
    isLactoseFree = context.read<MealState>().state.isLactoseFree;
    isVegan = context.read<MealState>().state.isVegan;
    isVegetarian = context.read<MealState>().state.isVegetarian;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          SelectWidget(
            text: "Gluten-Free",
            value: isGluttenFree,
            onChange: (value) {
              context.read<MealState>().updateMealType(MealType.isGlutenFree);
              setState(() {
                isGluttenFree = value;
              });
            },
          ),
          SelectWidget(
            text: "Lactose-Free",
            value: isLactoseFree,
            onChange: (value) {
              context.read<MealState>().updateMealType(MealType.isLactoseFree);
              setState(() {
                isLactoseFree = value;
              });
            },
          ),
          SelectWidget(
            text: "Vegan",
            value: isVegan,
            onChange: (value) {
              context.read<MealState>().updateMealType(MealType.isVegan);
              setState(() {
                isVegan = value;
              });
            },
          ),
          SelectWidget(
            text: "Vegetarian",
            value: isVegetarian,
            onChange: (value) {
              context.read<MealState>().updateMealType(MealType.isVegetarian);
              setState(() {
                isVegetarian = value;
              });
            },
          )
        ],
      ),
    );
  }
}
