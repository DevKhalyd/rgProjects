import 'package:flutter/material.dart';

import '../widgets/clock_widget.dart';

/// The screen that shows the widget according to screen's size or platform (Web, Mobile)
class ClockScreen extends StatelessWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ClockWidget(),
    );
  }
}
