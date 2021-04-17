import 'package:flutter/material.dart';
import 'package:sun_bear_blinds/views/ui/screens/blind_screen.dart';
import 'package:sun_bear_blinds/views/ui/screens/home_screen.dart';


class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {

    switch (routeSettings.name) {

      // case RootScreen.id:
      //   return MaterialPageRoute(settings: routeSettings, builder: (newContext) => RootScreen());
      //   break;

         case HomeScreen.id:
        return MaterialPageRoute(settings: routeSettings, builder: (newContext) => HomeScreen());
        break;

                case BlindScreen.id:
        return MaterialPageRoute(settings: routeSettings, builder: (newContext) => BlindScreen());
        break;

      // case AddTeamPresetScreen.id:
      //   return MaterialPageRoute<Map>(settings: routeSettings, builder: (newContext){

      //     Map _teamMap = Map.from(routeSettings?.arguments ?? {}); //* Necessary to 'clone' otherwise throws errors when editing the Map

      //     return AddTeamPresetScreen(
      //       teamMap: _teamMap,
      //     );
      //   });
      //   break;

      default:
        return null;
    }
  }
}