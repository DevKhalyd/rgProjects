import 'package:flutter/material.dart';

import 'painters/path_custom.dart';

const _side = 100.0;

/// The background and the image
class ImgProfile extends StatelessWidget {
  const ImgProfile({
    Key? key,
    required this.asset,
    this.side = _side,
  }) : super(key: key);

  final String asset;
  final double side;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: side,
      width: side,
      padding: EdgeInsets.all(8.0),
      child: ClipPath(
        clipper: PathCustom(),
        child: Container(
          color: Colors.grey.shade300,
          child: Transform.translate(
            offset: Offset(0, 8.5),
            child: Image.asset(
              asset,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
