import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/logger.dart';
import '../../../../../../core/utils/routes.dart';
import '../../../../../../core/widgets/dialogs/info_dialog.dart';
import 'attachment_files_controller.dart';
import 'whatsapp_camera_controller.dart';

const _bottomSpace = 10.0;
const _zero = 0.0;

/// Because this logic is not good implemented we should use another one
@deprecated
class BottomInputController extends GetxController {
  static BottomInputController get to => Get.find();

  late BuildContext context;

  /// The _controller of the user input
  TextEditingController controller = TextEditingController();

  FocusNode get focusNode => _focusNode;

  String _messageToSend = '';

  String get messageToSend => _messageToSend;

  bool _isKeyboardOpen = false;

  bool _shouldSendMessage = false;

  List<String> _messages = [];

  /// The keyboard space or the keyboardSize when is open or closed
  double bottomSpaceExtra = 230;
  bool isOpenEmojiMenu = false;

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

  // NOTE: Mic button to record a note voice
  // IMPROVE: You can use getters to access to this data

  bool isAnimatingButton = false;

  double paddingAll = 18.0;
  double sizeIcon = 25.0;
  double rightSide = 5.0;
  double bottomSide = _zero;

  final _bottomSideFinal = 15.0;

  final _rightSideInital = 5.0;
  final _rightSideFinal = -20.0;

  final _paddingInitial = 18.0;
  final _paddingFinal = 36.0;

  final _sizeIconInitial = 25.0;
  final _sizeIconFinal = 40.0;

  onLongPressMoveUpdate(LongPressMoveUpdateDetails d) {
    final lP = d.offsetFromOrigin;
    final dx = lP.dx.abs();
    final dy = lP.dy.abs();

    Log.console('DX $dx');

    // Validations to know where go

    if (dx > dy)
      _onAnimationGoingLeft(dx, dy);
    else
      _onAnimationGoingUp(dy, dx);
  }

  /// Run when the user is not going up
  void _onAnimationGoingLeft(double dx, double dy) {
    final width = context.width;
    final addRightSide = dx * .5;
    Log.console('DX Value: ');
    Log.console(dx);
    Log.console('Final value: ');
    Log.console(addRightSide);
    rightSide = _rightSideInital + addRightSide;
    if (rightSide > (width * .3)) return;
    update();
  }

  /// Run when the user is not going left
  void _onAnimationGoingUp(double dy, double dx) {
    final height = context.height;
    final addTopSide = dy * .25;
    bottomSide = _zero - addTopSide;
    if (rightSide > (height * .15)) return;
    Log.console(bottomSide);
    update();
  }

  onLongPressStart(_) {
    paddingAll = _paddingFinal;
    sizeIcon = _sizeIconFinal;
    rightSide = _rightSideFinal;
    bottomSide = _bottomSideFinal;
    isAnimatingButton = true;
    update();
  }

  onLongPressEnd(_) {
    paddingAll = _paddingInitial;
    sizeIcon = _sizeIconInitial;
    bottomSide = _zero;
    rightSide = _rightSideInital;
    isAnimatingButton = false;
    update();
  }

  // NOTE: Behavior of the input controller
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
    if (!shouldSendMessage) return;
    _messages.add(_messageToSend);
    _messageToSend = '';
    controller.clear();
    _shouldSendMessage = false;
    update();
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

  /// The MicButton widgets works in a different way
  double getBottomSpaceForMicButton() {
    final extraSpaceForIos = Platform.isIOS ? 25 : 0;
    return getBottomSpace() - bottomSide + extraSpaceForIos;
  }

  void _timerEmojiMenu() {
    Timer(Duration(milliseconds: 500), () {
      notifyChildrens();
    });
  }

  void onPressedCamera() async {
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

  void onTapFilesAttached() =>
      AttachmentFilesController.to.onTapFilesAttached();
}
