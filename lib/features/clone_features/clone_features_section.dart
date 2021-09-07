import 'package:flutter/material.dart';
import 'package:rg_projects/core/utils/routes.dart';
import 'package:rg_projects/home/widgets/section_button.dart';

import '../../home/screens/home_section.dart';

class CloneFeatureSection extends StatelessWidget {
  const CloneFeatureSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeSection(
      title: 'Clones Features',
      children: [
        SectionButton(
          section: 'Whatsapp - Chat',
          about: 'The input animation and the camera custom',
          route: Routes.WHATSAPP_CHAT,
        ),
      ],
    );
  }
}
