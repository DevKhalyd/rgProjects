import 'package:flutter/material.dart';

import 'circle_button_d_a.dart';

class BodyHD extends StatelessWidget {
  const BodyHD({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleButtonDA(),
          // Positioned(
          //   right: 20,
          //   child: _CircleCustom(),
          // ),
          // Positioned(
          //   top: 120,
          //   child: _CircleCustom(),
          // ),
          // Positioned(
          //   bottom: 40,
          //   child: _CircleCustom(),
          // ),
        ],
      ),
    );
  }
}
