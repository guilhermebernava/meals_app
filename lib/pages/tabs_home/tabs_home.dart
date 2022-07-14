import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/pages/tabs_home/children/drawer/main_drawer.dart';
import 'package:meals_app/pages/tabs_home/tabs_home_controller.dart';
import 'package:meals_app/themes/app_colors.dart';
import 'package:meals_app/themes/app_styles.dart';

class TabsHome extends StatefulWidget {
  const TabsHome({Key? key}) : super(key: key);

  @override
  State<TabsHome> createState() => _TabsHomeState();
}

class _TabsHomeState extends State<TabsHome> {
  final controller = TabsHomeController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MainDrawer(
        size: size,
        tabsHomeController: controller,
      ),
      appBar: AppBar(
        title: AnimatedCard(
          curve: Curves.decelerate,
          key: ValueKey(controller.pageIndex),
          duration: const Duration(milliseconds: 500),
          direction: AnimatedCardDirection.left,
          child: const Text(
            "MOCK",
          ),
        ),
      ),
      body: controller.pages(),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 2,
          enableFeedback: true,
          type: BottomNavigationBarType.shifting,
          currentIndex: controller.pageIndex,
          onTap: (value) => controller.onIndexChanged(value, setState),
          backgroundColor: AppColors.secundary,
          unselectedItemColor: Colors.white,
          selectedItemColor: AppColors.secundaryAccent,
          selectedLabelStyle: AppStyles.selectedTab,
          unselectedLabelStyle: AppStyles.unselectedTab,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Categories",
                backgroundColor: AppColors.secundary,
                tooltip: "Your categories of food"),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorites",
              backgroundColor: AppColors.secundary,
              tooltip: "Your favorites recipes",
            ),
          ]),
    );
  }
}
