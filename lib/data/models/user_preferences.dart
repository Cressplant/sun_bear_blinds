import 'package:flutter/material.dart';

class UserPreferences extends ChangeNotifier {

  bool _darkMode = false;

  bool get darkMode => _darkMode;

  void updateUserPreferences ({ required bool darkMode }) {

    //! commit to DB?

    _darkMode = darkMode;

    notifyListeners();

  }

}