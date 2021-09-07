import 'package:flutter/material.dart';

import '../../home/screens/home_section.dart';

class FancyWidgetsSection extends StatelessWidget {
  const FancyWidgetsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeSection(
      title: 'Fancy Widgets',
    );
  }
}
