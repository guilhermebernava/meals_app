import 'package:flutter/material.dart';

import '../../pages/category/category.dart';
import '../../pages/category/category_props.dart';

class CategoryItemController {
  void redirect(BuildContext context, String title, String id) {
    Navigator.pushNamed(
      context,
      Category.route,
      arguments: CategoryProps(title: title, id: id),
    );
  }
}
