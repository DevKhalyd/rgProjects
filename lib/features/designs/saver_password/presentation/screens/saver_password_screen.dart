import 'package:flutter/material.dart';
import 'package:rg_projects/features/designs/saver_password/presentation/screens/saver_password_home.dart';
import 'package:rg_projects/features/designs/saver_password/presentation/screens/saver_password_menu.dart';

/// This widget contains the whole screen for this design, the 
/// menu and the home
class SaverPasswordScreen extends StatelessWidget {
  const SaverPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SavePasswordHome(),
          SavePasswordMenu()
        ],
      ),
    );
  }
}
