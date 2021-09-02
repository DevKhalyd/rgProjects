import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mini_widgets.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    Key? key,
    this.title = 'Attention',
    this.button = 'Back',
    required this.description,
  }) : super(key: key);

  final String title, description, button;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextCustom(title),
      content: TextCustom(description),
      actions: [
        TextButton(
            onPressed: () => Get.back(),
            child: TextCustom(
              button,
              textAlign: TextAlign.justify,
            ))
      ],
    );
  }
}
