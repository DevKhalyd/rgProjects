import 'package:flutter/material.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
