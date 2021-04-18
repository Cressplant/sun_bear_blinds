import 'package:flutter/material.dart';

bool checkDesktop(BuildContext context){
  double limit = 1000;
  bool desktop = MediaQuery.of(context).size.width > limit;
  return desktop;
}

bool checkMobile(BuildContext context){
  bool mobile = MediaQuery.of(context).size.width < 600;
  return mobile;
}

//* Can be used within main(), while MediaQuery cannot
bool checkMobileAlt(){
  double _width =  WidgetsBinding.instance?.window.physicalSize.width ?? 800.0;
  return _width < 600;
}

//* Can be used within main(), while MediaQuery cannot
bool checkDesktopAlt(){
  double width = WidgetsBinding.instance?.window.physicalSize.width ?? 800.0;
  return width > 1000;
}