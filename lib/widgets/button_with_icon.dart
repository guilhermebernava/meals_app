import 'package:flutter/material.dart';

class ButtonWithIcon extends Padding {
  ButtonWithIcon({
    Key? key,
    required VoidCallback onTap,
    required String text,
    required IconData icon,
    required Color color,
    required Size size,
  }) : super(
          padding: const EdgeInsets.all(20),
          key: key,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 50,
                    color: color,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
}
