import 'package:flutter/material.dart';

class CategoryWidget extends GridView {
  CategoryWidget(
      {Key? key, required List<Widget> categories, required Size size})
      : super(
          key: key,
          children: categories,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: size.width * 0.45,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        );
}
