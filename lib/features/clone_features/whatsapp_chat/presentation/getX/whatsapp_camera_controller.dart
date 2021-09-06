import 'dart:io' show Platform;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/widgets/dialogs/info_dialog.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';

import 'slider_gallery_controller.dart';

const _staticDimension = 80.0;

enum Picked { picture, video }

class WhatsAppCameraController extends GetxController {
  static WhatsAppCameraController get to => Get.find();

  double _currentSliderHeight = SliderGalleryController.to.currentSliderHeight;

  CameraController? _controller;
  List<CameraDescription>? _cameras;

  int _cameraPosition = 0;
  double _dimensionSquare = 80.0;
  FlashMode _flashMode = FlashMode.off;
  bool _isRecording = false;

  double get opacity {
    return _currentSliderHeight.clamp(0.0, 1.0);
  }

  FlashMode get flashMode => _flashMode;
  double get dimensionSquare => _dimensionSquare;
  CameraController? get controller => _controller;

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
      _cameras = cams;
      _controller =
          CameraController(_cameras![_cameraPosition], ResolutionPreset.max);
      _controller!.initialize().then((value) {
        _controller!.setFlashMode(FlashMode.off);
        update();
      });
    });
    super.onInit();
  }

  @override
  void onClose() {
    _controller!.dispose();
    super.onClose();
  }

  onSwitchCamera() {
    if (_cameras!.length < 2) {
      Get.dialog(InfoDialog(description: 'No camera available'));
      return;
    }
    if (_cameraPosition == 0)
      _cameraPosition = 1;
    else
      _cameraPosition = 0;
    _controller =
        CameraController(_cameras![_cameraPosition], ResolutionPreset.max);
    _controller!.initialize().then((_) => update());
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
    _controller!.setFlashMode(_flashMode);
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
  onTapCamera({bool takePicture = true}) async {
    if (takePicture) _controller!.takePicture();
    Get.back(result: Picked.picture);
  }

  onLongPressCamera() async {
    _dimensionSquare = _staticDimension + 20;
    _isRecording = true;
    update();
    if (Platform.isIOS) await _controller!.prepareForVideoRecording();
    await _controller!.startVideoRecording();
  }

  onLongPressEndCamera(_) async {
    _dimensionSquare = _staticDimension;
    _isRecording = false;
    update();
    _controller!.stopVideoRecording();
    Get.back(result: Picked.video);
  }

  double getOpacity() => SliderGalleryController.to.getOpacity();
}
