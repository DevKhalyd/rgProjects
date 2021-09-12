import 'package:flutter/material.dart';

import '../../core/utils/routes.dart';
import '../../home/screens/home_section.dart';
import '../../home/widgets/section_button.dart';

class DesignsSection extends StatelessWidget {
  const DesignsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeSection(
      title: 'Designs',
      children: [
        SectionButton(
          section: 'Saver Password',
          about: 'Menu and main page with animations',
          route: Routes.SAVER_PASSWORD,
        ),
      ],
    );
  }
}
