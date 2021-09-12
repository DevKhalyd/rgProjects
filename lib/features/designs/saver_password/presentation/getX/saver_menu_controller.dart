import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Handle the left menu
class SaverMenuController extends GetxController {
  static SaverMenuController get to => Get.find();

  AnimationController? _controller;

  AnimationController get controller => _controller!;

  set controller(AnimationController c) => _controller = c;

  double get value => controller.value;

  /// The screen's width
  double width = Get.width;

  goForwardAnimation() => controller.fling();

  goBackAnimation() => controller.fling(velocity: -1.0);

  bool get isCloseMenu => !controller.isAnimating && value == .0;

  void onHorizontalDragUpdate(DragUpdateDetails d) {
    final dx = d.localPosition.dx;

    final space = width / 4;

    if (isCloseMenu && dx > space) return;

    final percentage = (dx / width).clamp(.0, 1).toDouble();
    controller.value = percentage;
  }

  // Just end or start the animation
  onHorizontalDragEnd(_) {
    if (value > 0.55)
      goForwardAnimation();
    else
      goBackAnimation();
  }

  onHorizontalDragDown(_) => controller.stop();
}
