import 'package:flutter/material.dart';

class RoundedImage extends ClipRRect {
  RoundedImage({
    Key? key,
    required String imageUrl,
    required Size size,
    required double height,
    BorderRadius borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
  }) : super(
          key: key,
          borderRadius: borderRadius,
          child: Image.network(
            imageUrl,
            height: size.height * height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        );
}
