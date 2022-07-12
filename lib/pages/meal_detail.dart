import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/themes/app_colors.dart';
import 'package:meals_app/themes/app_styles.dart';
import 'package:meals_app/widgets/meal_detail_ingredient_item.dart';
import 'package:meals_app/widgets/rounded_image.dart';

class MealDetail extends StatelessWidget {
  static const String route = "/mealDetail";

  final MealModel model;
  const MealDetail({Key? key, required this.model}) : super(key: key);

  Widget mealDetailtitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        text,
        style: AppStyles.mealtDetailsTitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedCard(
                curve: Curves.easeInOutCubicEmphasized,
                duration: const Duration(milliseconds: 400),
                direction: AnimatedCardDirection.top,
                child: RoundedImage(
                  imageUrl: model.imageUrl,
                  size: size,
                  height: 0.35,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 20),
              child: Column(
                children: [
                  mealDetailtitle("Ingredients"),
                  AnimatedCard(
                    curve: Curves.decelerate,
                    duration: const Duration(milliseconds: 300),
                    direction: AnimatedCardDirection.top,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => MealDeatilIngredientItem(
                          text: model.ingredients[index]),
                      itemCount: model.ingredients.length,
                    ),
                  ),
                  AnimatedCard(
                    curve: Curves.decelerate,
                    duration: const Duration(milliseconds: 300),
                    direction: AnimatedCardDirection.right,
                    child: const Divider(
                      thickness: 2,
                      color: AppColors.secundaryAccent,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                  mealDetailtitle("Steps"),
                  AnimatedCard(
                    curve: Curves.bounceIn,
                    duration: const Duration(seconds: 1),
                    direction: AnimatedCardDirection.bottom,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          MealDeatilIngredientItem(text: model.steps[index]),
                      itemCount: model.steps.length,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
