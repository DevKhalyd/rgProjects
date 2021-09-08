import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/mini_widgets.dart';
import 'card_circle_image.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CardCircleImage(),
        Space(0.015),
        TextCustom(
          label,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
