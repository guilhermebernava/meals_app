import 'package:flutter/material.dart';
import 'package:meals_app/themes/app_colors.dart';
import '../themes/app_styles.dart';

class MealDeatilIngredientItem extends Padding {
  MealDeatilIngredientItem({Key? key, required String text})
      : super(
          key: key,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              const Icon(
                Icons.circle,
                color: AppColors.backgroundLight,
                size: 12,
              ),
              const SizedBox(width: 20),
              Flexible(
                child: Text(
                  text,
                  textAlign: TextAlign.justify,
                  style: AppStyles.mealtDetailsItem,
                  overflow: TextOverflow.fade,
                  softWrap: true,
                ),
              ),
            ],
          ),
        );
}
