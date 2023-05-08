import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:articles/src/features/main/presentation/pages/main_page.dart';

class AppRouter {
  static String currentRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      case '/main':
        return CupertinoPageRoute(settings: RouteSettings(name: settings.name), builder: (_) => const MainPage());

      default:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
