import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rg_projects/core/utils/colors.dart';

import '../../../../../core/widgets/mini_widgets.dart';
import 'saver_password_home.dart';
import 'saver_password_menu.dart';

/// This widget contains the whole screen for this design, the
/// menu and the home
class SaverPasswordScreen extends StatelessWidget {
  const SaverPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionCustom(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsApp.saverPrimary,
        body: Stack(
          children: [
            SaverPasswordHome(),
            SavePasswordMenu(),
            // TODO: Add the slide menu...
          ],
        ),
      ),
    );
  }
}
