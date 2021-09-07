import 'package:flutter/material.dart';

final _color = Colors.grey;

class AddIcon extends StatelessWidget {
  const AddIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: _color,
          width: 3
        )
      ),
      child: Icon(
        Icons.add,
        color: _color,
        size: 20,
      ),
    );
  }
}
