import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/routes.dart';
import '../../../../../../core/utils/streams.dart';
import '../../../../../../core/widgets/dialogs/info_dialog.dart';
import '../widgets/animations/mic_trash_animation.dart';
import '../widgets/animations/trash_animation.dart';
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
  static BottomInputBtnController get to => Get.find();

  final streams = Streams();

  /// Counter for the stream
  ///
  /// Serves to avoid the rebuild of the counter
  HourMinute currentTime = HourMinute.zero();

  late BuildContext _context;

  double get widthScreen => _context.width;

  double get heightScreen => _context.height;

  set context(BuildContext context) => _context = context;

  // NOTE: Variables and methods for Button and Input Animated.

  /// The animation controller
  AnimationController? _controller;

  // variable to use
  /// Position globally to make some operations to get the current
  /// position of the user in the screen
  late double globalPositionStartDX, globalPositionStartDY;

  /// If this one is true means that the user maintains pressed the button
  ///
  /// And is moving to the left or moving to the up position
  bool readyForMoveButton = false;

  /// When the user is going up
  bool animatingUp = false;

  /// When the user is going left
  bool animatingLeft = false;

  /// If this one is set to true the input will to incres it's size
  /// and show the record widget and the block widget because depends on the same
  /// variable
  bool shouldExpandInputSize = false;

  /// Show the animation when the user drops the button
  bool _shouldShowATrashAnimation = false;

  /// If this one is executed another time create a flag that
  /// handle the animation time
  bool lastShowATrashAnimation = false;

  // Getters and Setters
  double paddingBtn = _paddingInitial;
  double sizeIcon = _sizeIconInitial;
  double rightSide = rightSideInitial;
  double bottomSide = bottomSideInitial;

  /// This controller almost handle all the animations
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

    // Going up
    if (dy < -15) {
      animatingLeft = false;
      animatingUp = true;

      /// See the explanation in dx
      final result = (dy / (globalPositionStartDY * .25)).abs();
      controller.value = result;
      return;
    }

    animatingUp = false;

    // Going left
    if (dx < -15.0) {
      animatingLeft = true;
      if (animatingLeft && !_shouldShowATrashAnimation)
        _shouldShowATrashAnimation = true;
      // Explanation of (globalPositionStartDX * .4):
      // Because this is the global positon and this one is multiplied by the half or less
      // This one gets faster or lower according to the value assig in the widget to animated
      // For example if we use the context.width * .2 the globalPostion should be lesser than 
      //the original. This because is less px to animate.
      final result = (dx / (globalPositionStartDX * .4)).abs();
      // Reset to the start point
      if (result > 0.95) {
        _onResetAnimation();
        return;
      }
      controller.value = result;
    } else {
      animatingLeft = false;
    }
  }

  /// Go to the base state
  _onResetAnimation() {
    // Return to the initial position
    readyForMoveButton = false;
    paddingBtn = _paddingInitial;
    sizeIcon = _sizeIconInitial;
    shouldExpandInputSize = false;
    animatingLeft = false;
    animatingUp = false;
    currentTime = HourMinute.zero();
    update();
    controller.fling(velocity: -1.0);
  }

  onLongPressEnd(_) {
    _onResetAnimation();
    if (_shouldShowATrashAnimation) {
      lastShowATrashAnimation = true;
      update();
    }
  }

  onLongPressStart(LongPressStartDetails d) {
    _onCloseEmojis();
    // Make bigger the button
    // NOTE: Check if this one should be showned
    _shouldShowATrashAnimation = false;
    shouldExpandInputSize = true;
    paddingBtn = _paddingFinal;
    sizeIcon = _sizeIconFinal;
    update();
    // Assign the global position in DX and DY
    globalPositionStartDX = d.globalPosition.dx;
    globalPositionStartDY = d.globalPosition.dy;
    controller.fling();
    lastShowATrashAnimation = false;
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
    final result = await Get.toNamed(Routes.WHATSAPP_CAMERA);

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

  // NOTE: Handle the application icon

  /// Icon Widget to show when the chat is launched the first time
  /// TrashAnimation when the user drops the button
  Widget _secondWidget = TrashAnimation(
    child: MicTrashAnimation(),
  );

  Widget getLeftInputWidget() {
    if (!lastShowATrashAnimation) return _getFirstWidget();
    return _secondWidget;
  }

  Widget _getFirstWidget() {
    return IconButton(
      onPressed: onTapEmojis,
      icon: Icon(
        Icons.emoji_emotions_outlined,
        color: Colors.grey,
      ),
    );
  }

  /// Restart the emoji icon in the user's input
  restartInput() {
    lastShowATrashAnimation = !lastShowATrashAnimation;
    update();
  }
}
