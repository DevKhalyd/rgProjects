import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListenerController extends GetxController {
  double height = 300;

  double? lastDy;

  onVerticalDragUpdate(DragUpdateDetails detais) {
    
    final dy = detais.globalPosition.dy;
    final useDy = lastDy ?? dy;

    if (dy > useDy) {
      height = 200;
    } else {
      height = 600;
    }

    update();

    lastDy = dy;
  }
}
