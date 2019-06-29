import 'package:flutter/material.dart';
import 'pages/search/search_page.dart';
import 'pages/home_page.dart';

final routes = {
  '/': (context) => HomePage(),
  '/search': (context, { arguments }) => SearchPage(arguments: arguments)
};

var onGenerateRoute = (RouteSettings settings) {
  final Function pageBuilder = routes[settings.name];

  if (pageBuilder != null) {
    Route route;
  
    if (settings.arguments != null) {
      route = MaterialPageRoute(
        builder: (context) => pageBuilder(context, arguments: settings.arguments)
      );
    } else {
      route = MaterialPageRoute(
        builder: (context) => pageBuilder(context)
      );
    }

    return route;
  }
};

