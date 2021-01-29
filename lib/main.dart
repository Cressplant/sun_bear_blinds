import 'package:flutter/material.dart';
import 'package:sun_bear_blinds/screens/home.dart';
// import 'package:google_fonts/google_fonts.dart';

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
        appBarTheme: AppBarTheme(
            color: Colors.white,
        )
      ),
      home: HomeScreen(),
    );
  }
}

