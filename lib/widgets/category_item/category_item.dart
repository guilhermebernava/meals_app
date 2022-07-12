import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/themes/app_styles.dart';
import 'package:meals_app/widgets/category_item/category_item_controller.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(
      {Key? key, required this.title, required this.color, required this.id})
      : super(key: key);

  final _borderRadius = BorderRadius.circular(20);
  final controller = CategoryItemController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: () => controller.redirect(context, title, id),
      borderRadius: _borderRadius,
      child: AnimatedCard(
        curve: Curves.decelerate,
        duration: const Duration(seconds: 1),
        direction: AnimatedCardDirection.top,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(mediaQuery.size.height * 0.02),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: _borderRadius,
          ),
          child: Text(
            title,
            style: AppStyles.categoryTitle,
          ),
        ),
      ),
    );
  }
}
