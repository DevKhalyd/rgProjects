import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getX/clock_controller.dart';
import '../widgets/clock_widget.dart';

/// The screen that shows the widget according to screen's size or platform (Web, Mobile)
class ClockScreen extends StatelessWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClockController>(
      init: ClockController(),
      builder: (c) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: ClockWidget(),
        );
      },
    );
  }
}
