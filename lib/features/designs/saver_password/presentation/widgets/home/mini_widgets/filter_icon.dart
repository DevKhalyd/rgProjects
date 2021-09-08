import 'package:flutter/material.dart';
import 'package:rg_projects/core/utils/colors.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      //The backgroundColor
      borderRadius: BorderRadius.circular(16),
      color: ColorsApp.saverPrimary,
      child: Center(
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            icon: const Icon(Icons.filter_list_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
