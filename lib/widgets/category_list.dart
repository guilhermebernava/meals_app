import 'package:flutter/material.dart';
import '../models/category.dart';
import 'category_item/category_item.dart';
import 'category_widget.dart';

class CategoryList extends Padding {
  CategoryList(Size size, {Key? key, required List<CategoryModel> categories})
      : super(
          key: key,
          padding:
              const EdgeInsets.only(top: 10.0, left: 10, right: 10, bottom: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height,
                  child: CategoryWidget(
                    size: size,
                    categories: categories
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
                SizedBox(
                  height: size.height * 0.05,
                )
              ],
            ),
          ),
        );
}
