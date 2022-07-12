import 'package:flutter/material.dart';
import 'package:meals_app/pages/tabs_home/children/drawer/main_drawer_controller.dart';
import 'package:meals_app/themes/app_colors.dart';
import 'package:meals_app/themes/app_styles.dart';
import 'package:meals_app/widgets/button_with_icon.dart';

class MainDrawer extends StatelessWidget {
  final Size size;
  MainDrawer({Key? key, required this.size}) : super(key: key);

  final controller = MainDrawerController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.2,
            width: double.infinity,
            alignment: Alignment.center,
            color: AppColors.secundaryAccent,
            child: const Text(
              "Hey, what's you up to ?",
              style: AppStyles.categoryTitle,
            ),
          ),
          ButtonWithIcon(
            onTap: () => controller.onTapMeals(context),
            size: size,
            text: "Meals",
            color: Colors.white,
            icon: Icons.food_bank,
          ),
          ButtonWithIcon(
            onTap: () => controller.onTapFilters(context),
            size: size,
            text: "Filters",
            color: Colors.white,
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
