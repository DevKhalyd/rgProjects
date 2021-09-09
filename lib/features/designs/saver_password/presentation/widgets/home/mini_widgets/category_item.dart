import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/mini_widgets.dart';
import 'card_circle_image.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.label, required this.asset})
      : super(key: key);

  final String label;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CardCircleImage(
          asset: asset,
        ),
        Space(0.015),
        TextCustom(
          label,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
