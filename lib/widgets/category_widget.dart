import 'package:flutter/material.dart';

class CategoryWidget extends GridView {
  CategoryWidget({Key? key, required List<Widget> categories})
      : super(
          key: key,
          children: categories,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        );
}
