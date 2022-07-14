import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/states/favorites_state.dart';
import 'package:meals_app/themes/app_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/widgets/category_item/category_item_controller.dart';

class CategoryItem extends StatefulWidget {
  final CategoryModel model;

  const CategoryItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  final _borderRadius = BorderRadius.circular(20);
  late bool isLiked;

  final controller = CategoryItemController();

  @override
  void initState() {
    isLiked = context.read<FavoritesState>().isLikedCategory(widget.model.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: () =>
          controller.redirect(context, widget.model.title, widget.model.id),
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
                widget.model.color.withOpacity(0.7),
                widget.model.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: _borderRadius,
          ),
          child: Stack(
            children: [
              Text(
                widget.model.title,
                style: AppStyles.categoryTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 100),
                child: IconButton(
                  onPressed: () {
                    context.read<FavoritesState>().likeCategory(widget.model);
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    size: 35,
                    color: isLiked ? Colors.yellowAccent : Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
