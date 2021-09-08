import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';

class TransformContainer extends StatefulWidget {
  const TransformContainer({Key? key}) : super(key: key);

  @override
  _TransformContainerState createState() => _TransformContainerState();
}

class _TransformContainerState extends State<TransformContainer> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {

    final val = lerpDouble(0, 12, value)!;
    print(val);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()
            ..rotateX(val)
            ..rotateY(val),
          child: Container(
            height: 100,
            width: 400,
            color: Colors.red,
          ),
        ),
        Space(0.09),
        Slider(
          value: value,
          onChanged: (v) {
            print(v);
            setState(() {
              value = v;
            });
          },
        )
      ],
    );
  }
}
