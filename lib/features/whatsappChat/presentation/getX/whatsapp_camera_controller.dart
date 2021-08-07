import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/dialogs/info_dialog.dart';
import '../../../../core/widgets/mini_widgets.dart';

import 'dart:io' show Platform;

const _staticDimension = 80.0;

enum Picked { picture, video }

class WhatsAppCameraController extends GetxController {
  static WhatsAppCameraController get to => Get.find();

  CameraController? controller;
  List<CameraDescription>? cameras;

  int _cameraPosition = 0;
  double _dimensionSquare = 80.0;
  FlashMode _flashMode = FlashMode.off;
  bool _isRecording = false;

  FlashMode get flashMode => _flashMode;
  double get dimensionSquare => _dimensionSquare;

  /// If the buttons should be visible when the camera button is pressed
  bool get isRecording => _isRecording;

  @override
  void onInit() {
    availableCameras().then((cams) {
      if (cams.isEmpty) {
        Get.dialog(
          AlertDialog(
            title: const TextCustom('Attention'),
            content: TextCustom('Cameras are not available'),
            actions: [
              TextButton(
                child: const TextCustom('Back'),
                onPressed: () => Get.back(),
              ),
            ],
          ),
          barrierDismissible: false,
        );
        return;
      }
      cameras = cams;
      controller =
          CameraController(cameras![_cameraPosition], ResolutionPreset.max);
      controller!.initialize().then((value) {
        controller!.setFlashMode(FlashMode.off);
        update();
      });
    });
    super.onInit();
  }

  @override
  void onClose() {
    controller!.dispose();
    super.onClose();
  }

  onSwitchCamera() {
    if (cameras!.length < 2) {
      Get.dialog(InfoDialog(description: 'No camera available'));
      return;
    }
    if (_cameraPosition == 0)
      _cameraPosition = 1;
    else
      _cameraPosition = 0;
    controller =
        CameraController(cameras![_cameraPosition], ResolutionPreset.max);
    controller!.initialize().then((_) => update());
  }

  onSwitchFlashMode() {
    switch (_flashMode) {
      case FlashMode.off:
        _flashMode = FlashMode.auto;
        break;
      case FlashMode.auto:
        _flashMode = FlashMode.always;
        break;
      case FlashMode.always:
        _flashMode = FlashMode.off;
        break;
      default:
        throw UnimplementedError('Missing FlashMode');
    }
    controller!.setFlashMode(_flashMode);
    update();
  }

  IconData getIconFlashes() {
    switch (_flashMode) {
      case FlashMode.off:
        return Icons.flash_off;
      case FlashMode.auto:
        return Icons.flash_auto;
      case FlashMode.always:
        return Icons.flash_on;
      default:
        throw UnimplementedError('Missing FlashMode');
    }
  }

  /// When the user wants to pic a photo
  onTapCamera() async {
    await controller!.takePicture();
    Timer(Duration(milliseconds: 1250), () => Get.back(result: Picked.picture));
  }

  onLongPressCamera() async {
    _dimensionSquare = _staticDimension + 20;
    _isRecording = true;
    update();
    if (Platform.isIOS) await controller!.prepareForVideoRecording();
    await controller!.startVideoRecording();
  }

  onLongPressEndCamera(_) async {
    _dimensionSquare = _staticDimension;
    _isRecording = false;
    update();
    await controller!.stopVideoRecording();
    Timer(Duration(milliseconds: 750), () => Get.back(result: Picked.video));
  }
}
