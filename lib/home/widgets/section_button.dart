import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/dialogs/info_dialog.dart';
import '../../../../core/widgets/mini_widgets.dart';

/// Open a secion and show some info about this one
class SectionButton extends StatelessWidget {
  const SectionButton({
    Key? key,
    required this.section,
    required this.about,
    required this.route,
    this.onPressed,
  }) : super(key: key);

  final String section, about, route;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => Get.toNamed(route),
            child: TextCustom(section),
          ),
          Space(0.01, isHorizontal: true),
          IconButton(
            onPressed: () => Get.dialog(InfoDialog(
              description: about,
              title: 'Info Section',
            )),
            icon: FaIcon(
              FontAwesomeIcons.questionCircle,
            ),
          ),
        ],
      ),
    );
  }
}
