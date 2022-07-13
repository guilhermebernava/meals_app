import 'package:flutter/material.dart';
import 'package:meals_app/themes/app_styles.dart';
import '../themes/app_colors.dart';

class SelectWidget extends Padding {
  SelectWidget({
    Key? key,
    required String text,
    required bool value,
    required void Function(bool value) onChange,
  }) : super(
          key: key,
          padding: const EdgeInsets.all(20.0),
          child: SwitchListTile(
            value: value,
            activeColor: AppColors.secundary,
            onChanged: onChange,
            title: Text(
              text,
              style: AppStyles.selectTitle,
            ),
          ),
        );
}
