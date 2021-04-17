import 'package:flutter/material.dart';
import 'package:sun_bear_blinds/views/ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(GoogleFonts.overlock().fontFamily);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sun Bear Blinds',
      theme: ThemeData(
          // fontFamily: GoogleFonts.overlock().fontFamily,
          fontFamily: 'Overlock',
          backgroundColor: Colors.white,
          // textTheme: TextTheme(headline6: TextStyle(color: Colors.black87)),
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.white,
            iconTheme: IconThemeData(),
            textTheme: TextTheme(headline6: TextStyle(color: Colors.black87, fontSize: 18.0)),
          )),
      home: HomeScreen(),
    );
  }
}
