import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sun_bear_blinds/business_logic/utils/themes.dart';
import 'package:sun_bear_blinds/data/models/user_preferences.dart';
import 'package:sun_bear_blinds/views/router/app_router.dart';
import 'package:sun_bear_blinds/views/ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => UserPreferences(), child: MaterialAppWithTheme(appRouter: AppRouter()));
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  final AppRouter appRouter;

  MaterialAppWithTheme({required this.appRouter});

  @override
  Widget build(BuildContext context) {
    bool _darkMode = Provider.of<UserPreferences>(context).darkMode;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sun Bear Blinds',
      theme: Themes.getTheme(darkMode: _darkMode),
      home: HomeScreen(),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
