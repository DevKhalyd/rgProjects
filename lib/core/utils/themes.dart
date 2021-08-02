import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rg_projects/core/utils/ui.dart';

abstract class MyThemes {
  static const SystemUiOverlayStyle lightTheme = SystemUiOverlayStyle(
    statusBarColor: UI.acentColor,
    systemNavigationBarColor: Colors.white,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  // IMPROVE: Set the colors according to the darkTheme
  static const SystemUiOverlayStyle darkTheme = SystemUiOverlayStyle(
    statusBarColor: Colors.red,
    systemNavigationBarColor: Colors.yellow,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const SystemUiOverlayStyle primaryTheme = SystemUiOverlayStyle(
    statusBarColor: UI.primaryColor,
    systemNavigationBarColor: Colors.white,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}
