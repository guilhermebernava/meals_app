import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/themes/app_styles.dart';
import 'package:meals_app/widgets/icon_text.dart';
import 'package:meals_app/widgets/meal_item/meal_item_controller.dart';

import '../../enums/meal_type.dart';

class MealItem extends InkWell {
  MealItem(
    BuildContext context, {
    Key? key,
    required MealModel model,
    required Size size,
  }) : super(
          key: key,
          onTap: () => MealItemController().redirect(context, model),
          child: AnimatedCard(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 500),
            direction: AnimatedCardDirection.left,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              margin: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          model.imageUrl,
                          height: size.height * 0.25,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: SizedBox(
                          width: size.width * 0.85,
                          child: Text(
                            model.title,
                            style: AppStyles.mealItemTitle,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconWithText(
                          text: "${model.duration} min",
                          icon: Icons.alarm,
                        ),
                        IconWithText(
                          text: Complexity.fromId(model.complexity).name,
                          icon: Icons.work,
                        ),
                        IconWithText(
                          text: Affordability.fromId(model.affordability).name,
                          icon: Icons.attach_money,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
}
