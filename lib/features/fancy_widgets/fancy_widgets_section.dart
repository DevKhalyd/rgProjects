import 'package:flutter/material.dart';

import '../../core/utils/routes.dart';
import '../../home/screens/home_section.dart';
import '../../home/widgets/section_button.dart';

class FancyWidgetsSection extends StatelessWidget {
  const FancyWidgetsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeSection(
      title: 'Fancy Widgets',
      children: [
        SectionButton(
          route: Routes.CLOCK_ANIMATION,
          section: 'Clock',
          about: 'A nice clock to watch the hour',
        ),
      ],
    );
  }
}
