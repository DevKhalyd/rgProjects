import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/utils/routes.dart';

// TODO: Fix the wasap status bar
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rolando Garcia Projects',
      theme: ThemeData(brightness: Brightness.light),
      initialRoute: Routes.INITIAL_ROUTE,
      getPages: Routes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
