import 'package:cats/features/cats_images/domain/entities/cat.dart';
import 'package:cats/features/cats_images/presentation/cubit/get_cats_images_cubit/get_cats_images_cubit.dart';
import 'package:cats/features/cats_images/presentation/screens/cat_details_screen.dart';
import 'package:cats/features/cats_images/presentation/screens/cats_grid_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cats/core/utils/injection_container.dart' as di;


class Routes {
  static const String initialRoute = '/';
  static const String catDetails = '/catDetails';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {

      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: ((context) => di.sl<GetCatsImagesCubit>()),
            child: const CatsGridViewScreen(),
          );
        }));
    case Routes.catDetails:
      return MaterialPageRoute(builder: (context) {
        return  CatDetailsScreen(cat: routeSettings.arguments as Cat);
      });
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text("No route found"),
              ),
            )));
  }
}
