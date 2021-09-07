import 'package:flutter/material.dart';
import 'package:rg_projects/core/utils/routes.dart';
import 'package:rg_projects/home/widgets/section_button.dart';

import '../../home/screens/home_section.dart';

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
