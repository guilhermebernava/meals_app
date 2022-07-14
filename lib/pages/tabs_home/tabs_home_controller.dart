import 'package:flutter/material.dart';
import 'package:meals_app/pages/home.dart';
import '../favorites/favoirtes.dart';

class TabsHomeController {
  Widget pages() {
    switch (pageIndex) {
      case 0:
        return const Home();
      case 1:
        return const Favorites();
      default:
        return const Center(child: Text("ERROR"));
    }
  }

  int pageIndex = 0;

  void onIndexChanged(int index, void Function(void Function() fn) setState) {
    setState(() {
      pageIndex = index;
    });
  }
}
