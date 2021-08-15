import 'package:flutter/material.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';

class MenuActionItem extends StatelessWidget {
  const MenuActionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          color: Colors.blue,
          child: Icon(Icons.document_scanner),
        ),
        Space(0.05),
        TextCustom('Hello there')
      ],
    );
  }
}
