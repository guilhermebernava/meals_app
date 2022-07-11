import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/pages/category/category.dart';
import 'package:meals_app/pages/category/category_props.dart';
import 'package:meals_app/pages/home.dart';
import 'package:meals_app/pages/meal_detail.dart';
import 'package:meals_app/pages/tabs_home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
      ),
      home: const TabsHome(),
      routes: {
        Category.route: (context) {
          var props =
              ModalRoute.of(context)?.settings.arguments as CategoryProps;
          return Category(
            recipeTitle: props.title,
            id: props.id,
          );
        },
        MealDetail.route: (context) {
          var model = ModalRoute.of(context)?.settings.arguments as MealModel;
          return MealDetail(model: model);
        }
      },
      //GERA ROTAS DE FORMA AUTOMATICA
      // onGenerateRoute: (settings) {
      //   if (settings.name == "/meals") {
      //     return MaterialPageRoute(builder: (ctx) => const Home());
      //   }
      // },
      //SE NN ENCONTRAR UMA ROTA ELA DEVOLVE UMA ROTA PADRAO
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => const Home()),
    );
  }
}
