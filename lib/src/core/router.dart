import 'package:articles/src/features/articles_main/articles_main/domain/entities/article_model.dart';
import 'package:articles/src/features/articles_main/articles_main/presentation/pages/articles_main_page.dart';
import 'package:articles/src/features/details/details/presentation/pages/details_page.dart';
import 'package:articles/src/features/search/search/presentation/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static String currentRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      case '/articles_page':
        return CupertinoPageRoute(
            settings: RouteSettings(name: settings.name),
            builder: (_) => const ArticlesMainPage());
      case '/details_page':
        return CupertinoPageRoute(
            settings: RouteSettings(name: settings.name),
            builder: (_) => DetailsPage(
              articleModel: settings.arguments as ArticleModel,
            ));
      case '/search_page':
        return CupertinoPageRoute(
            settings: RouteSettings(name: settings.name),
            builder: (_) => SearchPage(
              listArticle: (settings.arguments as List<ArticleModel>),
            ));

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
