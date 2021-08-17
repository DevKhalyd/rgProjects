import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/utils/routes.dart';
import '../../../../core/widgets/dialogs/info_dialog.dart';
import 'attachment_files_controller.dart';
import 'whatsapp_camera_controller.dart';

const _bottomSpace = 10.0;

class BottomInputController extends GetxController {
  static BottomInputController get to => Get.find();

  FocusNode _focusNode = FocusNode();

  BottomInputController() {
    listenTxtFieldFocus();
  }

  late BuildContext context;
  double bottomSpaceExtra = 230;
  bool isOpenEmojiMenu = false;

  FocusNode get focusNode => _focusNode;

  openCloseEmojiMenu() {
    AttachmentFilesController.to.closeMenu();
    if (isOpenEmojiMenu) {
      isOpenEmojiMenu = false;
      //OpenKeyboard
      FocusScope.of(context).requestFocus(_focusNode);
    } else {
      isOpenEmojiMenu = true;
      if (_focusNode.hasFocus) _focusNode.unfocus();
      _timerEmojiMenu();
    }
    update();
  }

  assignBottomExtraSpace(double space) {
    if (space > 0 && space > bottomSpaceExtra) {
      bottomSpaceExtra = space;
      update();
    }
  }

  assignContext(BuildContext c) => context = c;

  listenTxtFieldFocus() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        if (isOpenEmojiMenu) {
          isOpenEmojiMenu = false;
          _timerEmojiMenu();
          update();
        }
      }
    });
  }

  double getBottomSpace() {
    if (isOpenEmojiMenu) return bottomSpaceExtra + _bottomSpace + 10;
    return _bottomSpace;
  }

  void _timerEmojiMenu() {
    Timer(Duration(milliseconds: 500), () {
      notifyChildrens();
    });
  }

  void onPressedCamera() async {
    final result = await Get.toNamed(Routes.WHATSAPP_CAMARERA);

    if (result == null) return;

    String type;

    switch (result) {
      case Picked.picture:
        type = 'Picture';
        break;
      case Picked.video:
        type = 'Video';
        break;
      default:
        throw UnimplementedError('Missing case');
    }
    Get.dialog(InfoDialog(description: 'You have choosed $type'));
  }

  void onTapFilesAttached() =>
      AttachmentFilesController.to.onTapFilesAttached();
}
