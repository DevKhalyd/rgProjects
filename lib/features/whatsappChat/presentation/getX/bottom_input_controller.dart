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

  late BuildContext context;

  /// The _controller of the user input
  TextEditingController controller = TextEditingController();

  String _messageToSend = '';

  String get messageToSend => _messageToSend;

  bool _isKeyboardOpen = false;

  bool _shouldSendMessage = false;

  List<String> _messages = [];

  /// The message to show in the screen
  List<String> get messages => _messages;

  bool get isKeyboardOpen => _isKeyboardOpen;

  /// When the user enters data in the input this one should be true
  /// and change to a send icon otherwise change the icon to a mic icon
  bool get shouldSendMessage => _shouldSendMessage;

  FocusNode _focusNode = FocusNode();

  BottomInputController() {
    listenTxtFieldFocus();
  }

  /// The keyboard space
  double bottomSpaceExtra = 230;
  bool isOpenEmojiMenu = false;

  FocusNode get focusNode => _focusNode;

  onChanged(String msg) {
    if (msg.isEmpty) {
      if (_shouldSendMessage) {
        _shouldSendMessage = false;
        update();
      }
      if (_messageToSend.isNotEmpty) _messageToSend = '';
      return;
    }
    _messageToSend = msg;
    if (shouldSendMessage) return;
    _shouldSendMessage = true;
    update();
  }

  void onPressedSendMicButton() {
    if (shouldSendMessage) {
      _messages.add(_messageToSend);
      _messageToSend = '';
      controller.clear();
      update();
    } else {
      // TODO: Make the animation
    }
  }

  // NOTE: Basic behavior of the input
  openCloseEmojiMenu() {
    AttachmentFilesController.to.closeMenu();
    if (isOpenEmojiMenu) {
      isOpenEmojiMenu = false;
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
    if (space == 0)
      _isKeyboardOpen = false;
    else
      _isKeyboardOpen = true;
    update();
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

  double getBottomSpace({bool avoidValidations = false}) {
    if (avoidValidations) return bottomSpaceExtra + _bottomSpace + 10;
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
