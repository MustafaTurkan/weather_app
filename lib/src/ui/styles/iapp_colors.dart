import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class IAppColors {
  Color get accentPale;
  Color get accent;
  Color get canvas;
  Color get canvasPrimaryPale;
  Color get canvasDarkPale;
  Color get disabled;
  Color get divider;
  Color get success;
  Color get error;
  Color get warning;
  Color get info;
  Color get headerDisplayText;
  Color get mutedPlaceholderText;
  Color get bodyText;
  Color get disabledText;
  Color get primary;
  Color get primaryPale;
  Color get border;
  Color get canvasDark;
  Color get inputFillColor;
  Color get unselectedWidgetColor;
  Color get toggleableActiveColor;
  Color get textFieldBackground;
  //Inkwell
  Color get splash;
  Color get highlight;

  Color darken(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(), (c.blue * f).round());
  }

  Color brighten(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        c.alpha, c.red + ((255 - c.red) * p).round(), c.green + ((255 - c.green) * p).round(), c.blue + ((255 - c.blue) * p).round());
  }
}
