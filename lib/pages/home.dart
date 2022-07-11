import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/category_item/category_item.dart';
import 'package:meals_app/widgets/category_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final dummyCategories = DummyData.dummyCategories;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CategoryWidget(
          size: mediaQuery.size,
          categories: dummyCategories
              .map(
                (category) => CategoryItem(
                  key: ValueKey(category.id),
                  title: category.title,
                  color: category.color,
                  id: category.id,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
