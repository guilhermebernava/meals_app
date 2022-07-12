import 'package:meals_app/pages/favoirtes.dart';
import 'package:meals_app/pages/home.dart';

class TabsHomeController {
  final List<Map<String, dynamic>> pages = [
    {"page": Home(), "title": "Categories"},
    {"page": const Favorites(), "title": "Favorites"},
  ];
  int pageIndex = 0;

  void onIndexChanged(int index, void Function(void Function() fn) setState) {
    setState(() {
      pageIndex = index;
    });
  }
}
