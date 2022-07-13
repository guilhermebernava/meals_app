import 'package:flutter/material.dart';
import 'package:meals_app/states/category_state.dart';
import '../widgets/category_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: CategoryList(
        mediaQuery.size,
        categories: context.read<CategoryState>().favorites(),
      ),
    );
  }
}
