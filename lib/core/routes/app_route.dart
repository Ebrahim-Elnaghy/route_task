import 'package:flutter/material.dart';
import '../../features/home/presentation/pages/home.dart';
import 'routes.dart';

class AppRoutes {
  static Route? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());


      default:
        return null;
    }
  }
}
