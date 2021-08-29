import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/routes.dart';
import '../../../../core/widgets/dialogs/info_dialog.dart';
import 'attachment_files_controller.dart';
import 'whatsapp_camera_controller.dart';

// Button values
const _paddingInitial = 18.0;
const _paddingFinal = 30.0;

const _sizeIconInitial = 25.0;
const _sizeIconFinal = 40.0;

// Positioned values
const rightSideInitial = 5.0;
const rightSideFinal = -20.0;

const bottomSideInitial = 5.0;
const bottomSideFinal = -20.0;

/// Handle the input, the button, emojis in the whatsapp_chat screen
///
/// Almost everything, this because interacts with each other
class BottomInputBtnController extends GetxController {
  late BuildContext _context;

  double get widthScreen => _context.width;

  double get heightScreen => _context.height;

  set context(BuildContext context) => _context = context;

  /// The keyboard space or the _keyboardSize
  /// when is open or closed
  /// A default size
  double _keyboardSize = 230;

  double get keyboardSize => _keyboardSize;

  set keyboardSize(double space) {
    if (space > 0 && space > keyboardSize) {
      keyboardSize = space;
      update();
    }
    /* if (space == 0)
      _isKeyboardOpen = false;
    else
      _isKeyboardOpen = true;
    update();*/
  }

  BottomInputBtnController(
      //this._context
      ) {
    // TODO: Check if this one updates each time the user press on the input
    // keyboardSize = MediaQuery.of(_context).viewInsets.bottom;
    print('KeyboardSize: $keyboardSize');
  }

  // NOTE: Variables and methods for Button Aniamted. Check the at the file top to see the

  /// The animation controller
  AnimationController? _controller;

  // variable to use
  /// Position globally to make some operations to get the current
  /// position of the user in the screen
  late double globalPositionStartDX, globalPositionStartDY;

  /// If this one is true means that the user maintains pressed the button
  ///
  /// And is moving to the left
  bool readyForMoveButton = false;
  bool animatingUp = false;

  // Getters and Setters
  double paddingBtn = _paddingInitial;
  double sizeIcon = _sizeIconInitial;
  double rightSide = rightSideInitial;
  double bottomSide = bottomSideInitial;

  AnimationController get controller => _controller!;

  set controller(AnimationController c) {
    if (_controller == null) _controller = c;
  }

  onLongPressMoveUpdate(LongPressMoveUpdateDetails d) {
    readyForMoveButton = true;

    // Move the button according to the user movents
    final localOffsetFromOrigin = d.localOffsetFromOrigin;
    final dx = localOffsetFromOrigin.dx;
    final dy = localOffsetFromOrigin.dy;

    if (dy < -15) {
      animatingUp = true;
      final result = (dy / (globalPositionStartDY * .25)).abs();
      controller.value = result;
      return;
    }

    animatingUp = false;

    if (dx < -15.0) {
      // Explanation of (globalPositionStartDX * .4):
      // Because this is the global positon and this one is multiplied by the half or less
      // This one gets faster or lower according to the value assig in the widget to animated
      // For example if we use the context.width * .2 the globalPostion should be lesser than the original
      // This because is less px to animate.
      final result = (dx / (globalPositionStartDX * .4)).abs();
      // Reset to the start point
      if (result > 0.95) {
        _onResetAnimation();
        return;
      }
      controller.value = result;
    }
  }

  /// Go to the base state
  _onResetAnimation() {
    // Return to the initial position
    readyForMoveButton = false;
    paddingBtn = _paddingInitial;
    sizeIcon = _sizeIconInitial;
    update();
    controller.fling(velocity: -1.0);
  }

  onLongPressEnd(_) {
    _onResetAnimation();
  }

  onLongPressStart(LongPressStartDetails d) {
    _onCloseEmojis();
    // Make bigger the button
    paddingBtn = _paddingFinal;
    sizeIcon = _sizeIconFinal;
    update();
    // Assign the global position in DX and DY
    globalPositionStartDX = d.globalPosition.dx;
    globalPositionStartDY = d.globalPosition.dy;
    controller.fling();
  }

  onTap() {
    if (!isMicIcon) {
      final text = _inputController.text;
      messages.add(text);
      _inputController.clear();
      update();
    }
  }

  // NOTE: Variables and methods for Input User

  final messages = [];
  TextEditingController _inputController = TextEditingController();
  FocusNode _inputFocus = FocusNode();
  bool isMicIcon = true;

  Icon getIconForAnimatedBtn() {
    return Icon(
      isMicIcon ? Icons.mic : Icons.send,
      color: Colors.white,
      size: sizeIcon,
    );
  }

  _listenerInputController() {
    final text = _inputController.text;
    if (text.isEmpty) {
      if (!isMicIcon) {
        isMicIcon = true;
        update();
      }
      return;
    }
    if (isMicIcon) {
      isMicIcon = false;
      update();
    }
  }

  TextEditingController get inputController {
    _inputController.addListener(_listenerInputController);
    return _inputController;
  }

  FocusNode get inputFocus {
    _inputFocus.addListener(_listenerFocus);
    return _inputFocus;
  }

  _listenerFocus() {
    final hasFocus = _inputFocus.hasFocus;
    if (hasFocus) if (isOpenEmojiMenu) _onCloseEmojis();
  }

  // NOTE: Methos for icons in the input controller

  onTapFilesAttached() => AttachmentFilesController.to.onTapFilesAttached();

  onTapCamera() async {
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

  // NOTE: Emoji method and variables...
  final heightEmojisMenu = 250.0;
  bool _isOpenMenuEmojis = false;
  bool get isOpenEmojiMenu => _isOpenMenuEmojis;

  /// Close or open the menu depending on the current state
  onTapEmojis() {
    // Close
    if (_isOpenMenuEmojis) {
      _isOpenMenuEmojis = false;
    }
    // Open
    else {
      _isOpenMenuEmojis = true;
      if (_inputFocus.hasFocus) _inputFocus.unfocus();
    }
    update();
  }

  /// Close the emoji menu to avoid bad interactions with another animaitons
  _onCloseEmojis() {
    if (!isOpenEmojiMenu) return;
    _isOpenMenuEmojis = false;
    update();
  }

  double getExtraSpaceForEmojiMenu() =>
      // 10 more to make a space between the widgets
      _isOpenMenuEmojis ? heightEmojisMenu + 7.5 : 0;
}
