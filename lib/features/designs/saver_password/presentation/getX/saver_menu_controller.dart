import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Handle the left menu
class SaverMenuController extends GetxController {
  static SaverMenuController get to => Get.find();
  AnimationController? _controller;

  AnimationController get controller => _controller!;

  set controller(AnimationController c) => _controller = c;

  double get value => controller.value;
}
