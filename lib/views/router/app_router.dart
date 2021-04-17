import 'package:flutter/material.dart';
import 'package:sun_bear_blinds/data/models/blind.dart';
import 'package:sun_bear_blinds/views/ui/screens/blind_screen.dart';
import 'package:sun_bear_blinds/views/ui/screens/error_screen.dart';
import 'package:sun_bear_blinds/views/ui/screens/home_screen.dart';


class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {

    switch (routeSettings.name) {

         case HomeScreen.id:
        return MaterialPageRoute(settings: routeSettings, builder: (newContext) => HomeScreen());

                case BlindScreen.id:
        return MaterialPageRoute(settings: routeSettings, builder: (newContext) => BlindScreen(blind: routeSettings.arguments as Blind));

      default:
         return MaterialPageRoute(settings: routeSettings, builder: (newContext) => ErrorScreen());
    }
  }
}