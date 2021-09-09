import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rg_projects/features/designs/saver_password/presentation/screens/saver_password_screen.dart';

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
      home: SaverPasswordScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      //initialRoute: Routes.INITIAL_ROUTE,
      // getPages: Routes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
