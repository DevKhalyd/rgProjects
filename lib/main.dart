import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/utils/routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RG Projects',
      theme: ThemeData(
        brightness: Brightness.light,
        //https://stackoverflow.com/a/66918373/10942018
        appBarTheme:
            Theme.of(context).appBarTheme.copyWith(brightness: Brightness.dark),
      ),
      initialRoute: Routes.INITIAL_ROUTE,
      getPages: Routes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
