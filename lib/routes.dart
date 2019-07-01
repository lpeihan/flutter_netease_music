import 'package:flutter/material.dart';
import 'package:flutter_netease_music/pages/discover/playlist_page.dart';
import 'package:flutter_netease_music/pages/home/home_page.dart';
import 'package:flutter_netease_music/pages/player/player.dart';
import 'package:flutter_netease_music/pages/search/search_page.dart';

final routes = {
  '/': (context) => HomePage(),
  '/search': (context) => SearchPage(),
  '/playlist': (context, { arguments }) => PlaylistPage(arguments: arguments,),
  '/player': (context) => Player()
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

