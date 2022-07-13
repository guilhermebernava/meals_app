import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/states/category_state.dart';
import 'package:meals_app/themes/app_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/widgets/category_item/category_item_controller.dart';

class CategoryItem extends StatefulWidget {
  final String title;
  final Color color;
  final String id;

  const CategoryItem(
      {Key? key, required this.title, required this.color, required this.id})
      : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  final _borderRadius = BorderRadius.circular(20);
  late bool isLiked;

  final controller = CategoryItemController();

  @override
  void initState() {
    isLiked = context.read<CategoryState>().isLiked(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: () => controller.redirect(context, widget.title, widget.id),
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
                widget.color.withOpacity(0.7),
                widget.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: _borderRadius,
          ),
          child: Stack(
            children: [
              Text(
                widget.title,
                style: AppStyles.categoryTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 100),
                child: IconButton(
                  onPressed: () {
                    context
                        .read<CategoryState>()
                        .addFavoriteCategory(widget.id);
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
