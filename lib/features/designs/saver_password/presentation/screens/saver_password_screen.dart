import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/durations.dart';
import '../../../../../core/widgets/mini_widgets.dart';
import '../getX/saver_controller.dart';
import '../getX/saver_menu_controller.dart';
import '../widgets/home/mini_widgets/add_account_btn.dart';
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
    with TickerProviderStateMixin {
  late AnimationController controller;

  /// The left button menu...
  late AnimationController menuController;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Durations.defaultAnimation);
    SaverController.to.controller = controller;
    menuController =
        AnimationController(vsync: this, duration: Durations.defaultAnimation);
    SaverMenuController.to.controller = menuController;
  }

  @override
  void dispose() {
    controller.dispose();
    menuController.dispose();
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
            _BluerBottomMenu(),
            SliderBottomMenu(),
            AddAccountBtn(),
            _BluerLeftMenu(),
            SavePasswordMenu(),
          ],
        ),
      ),
    );
  }
}

class _BluerBottomMenu extends StatelessWidget {
  const _BluerBottomMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaverController>(builder: (c) {
      return AnimatedBuilder(
          animation: c.controller,
          child: Container(),
          builder: (_, child) {
            final value = lerpDouble(0, 10, c.valueController)!;
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
              child: child,
            );
          });
    });
  }
}

class _BluerLeftMenu extends StatelessWidget {
  const _BluerLeftMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaverMenuController>(builder: (c) {
      return AnimatedBuilder(
          animation: c.controller,
          child: Container(),
          builder: (_, child) {
            final value = lerpDouble(0, 10, c.value)!;
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
              child: child,
            );
          });
    });
  }
}
