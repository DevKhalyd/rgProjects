import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rg_projects/core/utils/durations.dart';
import 'package:rg_projects/features/designs/saver_password/presentation/getX/saver_controller.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/mini_widgets.dart';
import '../widgets/home/slider_bottom_menu.dart';
import 'saver_password_home.dart';
import 'saver_password_menu.dart';

/// This widget contains the whole screen for this design, the
/// menu and the home
class SaverPasswordScreen extends StatefulWidget {
  const SaverPasswordScreen({Key? key}) : super(key: key);

  @override
  _SaverPasswordScreenState createState() => _SaverPasswordScreenState();
}

class _SaverPasswordScreenState extends State<SaverPasswordScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Durations.defaultAnimation);
    SaverController.to.controller = controller;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
            SliderBottomMenu(),
            // TODO: React this button to the changes of the lattest accounts
            // AddAccountBtn(),
            SavePasswordMenu(),
          ],
        ),
      ),
    );
  }
}
