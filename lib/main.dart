import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'features/designs/credit_app/presentation/screens/activity_screen.dart';

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
      ),
      //initialRoute: Routes.INITIAL_ROUTE,
      //getPages: Routes.pages,
      home: ActivityScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
