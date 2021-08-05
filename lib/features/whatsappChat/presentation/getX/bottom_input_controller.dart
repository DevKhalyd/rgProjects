import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

const bottomSpace = 10.0;
const defaultAnimation = Duration(milliseconds: 250);

class BottomInputController extends GetxController {
  static BottomInputController get to => Get.find();

  FocusNode _focusNode = FocusNode();

  BottomInputController() {
    listenFocus();
  }

  late BuildContext context;
  double bottomSpaceExtra = 230;
  bool isOpenEmojiMenu = false;

  FocusNode get focusNode => _focusNode;

  openCloseEmojiMenu() {
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

  listenFocus() {
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
    if (isOpenEmojiMenu) return bottomSpaceExtra + bottomSpace + 10;
    return bottomSpace;
  }

  void _timerEmojiMenu() {
    Timer(Duration(milliseconds: 500), () {
      notifyChildrens();
    });
  }
}
