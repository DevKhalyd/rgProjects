import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
    this.useWeb = false,
  }) : super(key: key);

  final String section, about, route;
  final VoidCallback? onPressed;

  /// If it's web and this one is true the screen will be shown
  final bool useWeb;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              if (kIsWeb && !useWeb) {
                final url =
                    'https://play.google.com/store/apps/details?id=com.rg.rg_projects';

                await Get.dialog(InfoDialog(
                  description:
                      'This screen was designed to be used in phones. Please check: $url',
                  title: 'No supported in web',
                ));

                launch(url);
                
                return;
              }

              Get.toNamed(route);
            },
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
