import 'package:flutter/material.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';

class MenuActionItem extends StatelessWidget {
  const MenuActionItem(
      {Key? key, required this.label, required this.icon, required this.color})
      : super(key: key);

  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Space(0.012),
          TextCustom(
            label,
            fontSize: 13,
          )
        ],
      ),
    );
  }
}
