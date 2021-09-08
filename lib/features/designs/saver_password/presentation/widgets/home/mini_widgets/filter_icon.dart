import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      //The backgroundColor
      color: ColorsApp.saverPrimary,
      borderRadius: BorderRadius.circular(16.0),
      clipBehavior: Clip.hardEdge,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.orange,
        ),
        child: IconButton(
          icon: const Icon(Icons.filter_list_outlined),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}
