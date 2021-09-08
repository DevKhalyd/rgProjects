import 'package:flutter/material.dart';

const _side = 50.0;

class CardCircleImage extends StatelessWidget {
  const CardCircleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          height: _side,
          width: _side,
        ),
      ),
    );
  }
}
