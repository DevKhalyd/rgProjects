import 'package:flutter/material.dart';

final _colors = [
  Colors.white.withOpacity(.05),
  Colors.white.withOpacity(.1),
  Colors.white.withOpacity(.15),
  Colors.white.withOpacity(.2),
];

class ShapeTransparent extends StatelessWidget {
  const ShapeTransparent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      //alignment: Alignment.topRight,
      // transform: Matrix4.identity(),
      alignment: Alignment.bottomCenter,
      transform: Matrix4.identity()
        ..rotateX(2.5)
        ..rotateY(2.5),
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: _colors.reversed.toList(),
            )),
      ),
    );
  }
}
