
import 'package:flutter/material.dart';
import 'dart:math' as math;

Color getContrastingTextColor (Color backgroundColor) {

  double bias = 1.0;

  int v = math.sqrt(math.pow(backgroundColor.red, 2) * 0.299 +
          math.pow(backgroundColor.green, 2) * 0.587 +
          math.pow(backgroundColor.blue, 2) * 0.114)
      .round();

  return v < 130 * bias ? Colors.white : Colors.black;

}