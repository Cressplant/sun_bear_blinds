
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:sun_bear_blinds/data/models/user_preferences.dart';

class RootScreen extends StatefulWidget {

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {


  @override
  void initState() { 

    _initialiseUser(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator())
    );
  }

  Future<void> _initialiseUser (BuildContext context) async {

          bool _darkMode = SchedulerBinding.instance?.window.platformBrightness == Brightness.dark; //! get from DB and set to this if null

          Provider.of<UserPreferences>(context, listen: false).updateUserPreferences(darkMode: _darkMode);

  }

}