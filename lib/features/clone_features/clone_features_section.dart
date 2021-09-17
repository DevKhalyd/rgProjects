import 'package:flutter/material.dart';
import '../../core/utils/routes.dart';
import '../../home/screens/home_section.dart';
import '../../home/widgets/section_button.dart';

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
