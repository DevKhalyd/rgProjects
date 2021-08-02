import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/utils/routes.dart';

import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RG Projects',
      initialRoute: Routes.INITIAL_ROUTE,
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
    );
  }
}
