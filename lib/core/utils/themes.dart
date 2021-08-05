import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rg_projects/core/utils/ui.dart';

abstract class MyThemes {
  static const SystemUiOverlayStyle lightTheme = SystemUiOverlayStyle(
    statusBarColor: UI.acentColor,
    systemNavigationBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const SystemUiOverlayStyle primaryTheme = SystemUiOverlayStyle(
    statusBarColor: UI.primaryColor,
    systemNavigationBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}
