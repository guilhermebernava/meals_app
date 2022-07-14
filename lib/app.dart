import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/models/meal_state_model.dart';
import 'package:meals_app/pages/category/category.dart';
import 'package:meals_app/pages/category/category_props.dart';
import 'package:meals_app/pages/filter.dart';
import 'package:meals_app/pages/meal_detail.dart';
import 'package:meals_app/pages/tabs_home/tabs_home.dart';
import 'package:meals_app/services/shared_preferences.dart';
import 'package:meals_app/states/category_state.dart';
import 'package:meals_app/states/favorites_state.dart';
import 'package:meals_app/states/meal_state.dart';
import 'themes/app_colors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferencesServices.initState(),
      builder: (context, snapshot) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CategoryState(),
          ),
          BlocProvider(
            create: (_) => FavoritesState(),
          ),
          BlocProvider(
            create: (_) => MealState(snapshot.data as MealStateModel),
          )
        ],
        child: MaterialApp(
          title: 'Meals App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: const MaterialColor(
                        AppThemeColor.color, AppThemeColor.colors))
                .copyWith(secondary: AppColors.secundary),
            canvasColor: AppColors.background,
            fontFamily: 'Raleway',
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColors.background,
                fontFamily: "RobotoCondensed",
              ),
            ),
          ),
          routes: {
            "/": (context) => const TabsHome(),
            Category.route: (context) {
              var props =
                  ModalRoute.of(context)?.settings.arguments as CategoryProps;
              return Category(
                recipeTitle: props.title,
                id: props.id,
              );
            },
            MealDetail.route: (context) {
              var model =
                  ModalRoute.of(context)?.settings.arguments as MealModel;
              return MealDetail(model: model);
            },
            Filter.route: (context) => const Filter(),
          },
          //GERA ROTAS DE FORMA AUTOMATICA
          // onGenerateRoute: (settings) {
          //   if (settings.name == "/meals") {
          //     return MaterialPageRoute(builder: (ctx) => const Home());
          //   }
          // },
          //SE NN ENCONTRAR UMA ROTA ELA DEVOLVE UMA ROTA PADRAO
          onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (ctx) => const TabsHome(),
          ),
        ),
      ),
    );
  }
}
