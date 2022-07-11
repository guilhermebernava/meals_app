import 'package:flutter/material.dart';
import 'package:meals_app/pages/favoirtes.dart';
import 'package:meals_app/pages/home.dart';

class TabsHome extends StatefulWidget {
  const TabsHome({Key? key}) : super(key: key);

  @override
  State<TabsHome> createState() => _TabsHomeState();
}

class _TabsHomeState extends State<TabsHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: const TabBarView(children: [
          Home(),
          Favorites(),
        ]),
        bottomSheet: const TabBar(
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.amber,
          indicatorColor: Colors.pink,
          indicatorWeight: 25,
          tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: "Categories",
            ),
            Tab(
              icon: Icon(Icons.star_rate_rounded),
              text: "Favorites",
            ),
          ],
        ),
      ),
    );
  }
}
