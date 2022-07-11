import 'package:flutter/material.dart';

class IconWithText extends Row {
  IconWithText({
    Key? key,
    required String text,
    required IconData icon,
    double space = 6,
  }) : super(
          key: key,
          children: [
            Icon(
              icon,
              size: 20,
            ),
            SizedBox(width: space),
            Text(
              text,
              style:
                  const TextStyle(fontSize: 15, fontFamily: "RobotoCondesend"),
            )
          ],
        );
}
