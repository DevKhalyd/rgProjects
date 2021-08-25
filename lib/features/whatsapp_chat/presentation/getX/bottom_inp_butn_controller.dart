import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  BottomInputBtnController(this._context) {
    // TODO: Check if this one updates each time the user press on the input
    keyboardSize = MediaQuery.of(_context).viewInsets.bottom;
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
  bool readyForMoveButton = false;

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
    //final dy = localOffsetFromOrigin.dy;
    // Going to left
    if (dx < 0.0) {
      final result = (dx / globalPositionStartDX).abs();
      controller.value = result;
      return;
    }
  }

  onLongPressEnd(_) {
    // Return to the initial position
    readyForMoveButton = false;
    paddingBtn = _paddingInitial;
    sizeIcon = _sizeIconInitial;
    update();
    controller.fling(velocity: -1.0);
  }

  onLongPressStart(LongPressStartDetails d) {
    // Make bigger the button
    paddingBtn = _paddingFinal;
    sizeIcon = _sizeIconFinal;
    update();
    // Assign the global position in DX and DY
    globalPositionStartDX = d.globalPosition.dx;
    globalPositionStartDY = d.globalPosition.dy;
    controller.fling();
  }

  // NOTE: Variables and methods for Input User

}
