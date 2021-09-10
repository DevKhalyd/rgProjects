import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaverController extends GetxController {
  static SaverController get to => Get.find();

  AnimationController? _controller;

  AnimationController get controller => _controller!;

  /// Value from .0 to 1.0
  double get valueController => controller.value;

  /// GlobalPositionDY...
  double? globalPositionDY;

  bool _isOpenBottomMenu = false;

  set controller(AnimationController v) {
    if (_controller == null) _controller = v;
  }

  onVerticalDragUpdate(DragUpdateDetails d) {
    final globalPositionDYLocal = d.globalPosition.dy;

    if (globalPositionDYLocal > globalPositionDY!) return;

    final localDy = d.localPosition.dy.abs();
    // Percentage
    final percentage = (localDy / globalPositionDY!).clamp(0.0, 1.0);
    if (_isOpenBottomMenu)
      controller.value = 1.0 - percentage;
    else
      controller.value = percentage;
  }

  onVerticalDragStart(DragStartDetails d) {
    final globalDY = d.globalPosition.dy;
    if (globalPositionDY == null) globalPositionDY = globalDY;
  }

  /// End the animation
  onVerticalDragEnd(_) {
    if (valueController > 0.55) {
      controller.fling(velocity: 1.0);
      _isOpenBottomMenu = true;
    } else {
      controller.fling(velocity: -1.0);
      _isOpenBottomMenu = false;
    }
  }
}
