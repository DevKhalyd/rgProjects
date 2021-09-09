import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaverController extends GetxController {
  static SaverController get to => Get.find();

  AnimationController? _controller;

  AnimationController get controller => _controller!;

  set controller(AnimationController v) {
    if (_controller == null) _controller = v;
  }

  onVerticalDragUpdate(DragUpdateDetails _) {}
  
  onVerticalDragEnd(DragEndDetails _) {}

  onVerticalDragStart(DragStartDetails _) {}
}
