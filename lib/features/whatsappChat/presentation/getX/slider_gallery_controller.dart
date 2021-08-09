import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

const _debouncerMilliseconds = 20;

/// Handle the gallery menu in the phone
class SliderGalleryController extends GetxController {
  static SliderGalleryController get to => Get.find();

  /// The _maxHeight in the screen
  late double _maxHeight;

  /// The _status bar size
  late double _paddingTop;

  double? lastDyUsed;

  /// The minDy to use in the animation
  double? minDy;

  Duration _animationDuration = Duration(milliseconds: 300);

  // NOTE: IF the space needed to change is greater than 4 the time should change
  Duration get animationDuration => _animationDuration;

  double get minSliderHeight => _maxHeight * .33;

  double get maxSliderHeight => _maxHeight - _paddingTop;

  bool get _isClosedSlider => _currentSliderHeight == minSliderHeight;

  bool get _isOpenSlider => _currentSliderHeight == maxSliderHeight;

  /// No open and not closed.
  ///
  /// The user is controlling the state of the menu
  bool get _isNeitherState => !_isOpenSlider && !_isClosedSlider;

  double _currentSliderHeight = 0;

  double get currentSliderHeight => _currentSliderHeight;

  /// Init all the values necessaries in the controller
  void initValues({required double mH, required double pT}) {
    _maxHeight = mH;
    _paddingTop = pT;
    _currentSliderHeight = minSliderHeight;
  }

  void onTap() {
    _assignAnimationDuration(400);
    if (_currentSliderHeight == maxSliderHeight)
      _currentSliderHeight = minSliderHeight;
    else if (_currentSliderHeight == minSliderHeight)
      _currentSliderHeight = maxSliderHeight;
    update();
  }

  void onVerticalDragUpdate(DragUpdateDetails d) {
    final localOffsetFromOrigin = d.localPosition;
    final dyGlobal = d.globalPosition.dy;

    /// Dy in number positive
    ///
    /// When goes up means the the slider is moving up
    ///
    /// otherwise is moving down
    final dy = (localOffsetFromOrigin.dy) * -1;
    final lastDy = lastDyUsed ?? dy;
    // First time
    if (minDy == null)
      minDy = dy;
    else if (dy < minDy!) minDy = dy;

    final useMinDy = minDy!;

    // Limits
    if (dyGlobal <= _paddingTop || dy <= useMinDy) return;

    double spaceToAdd = 0;

    final isGoingUp = dy > lastDy;
    final isGoingDown = dy < lastDy;

    // Going up
    if (isGoingUp) {
      final space = dy - lastDy;

      if (space < 3.0) {
        _assignAnimationDuration(20);
      } else {
        _assignAnimationDuration(100);
      }
      spaceToAdd = space;

      if (space > 200) spaceToAdd /= space;
    }
    // Going down
    else if (isGoingDown) {
      final space = lastDy - dy;
      if (space < 3.0) {
        _assignAnimationDuration(20);
      } else {
        _assignAnimationDuration(100);
      }
      spaceToAdd = space * -1;

      // Sometimes add some extra space
      if (spaceToAdd < -200) spaceToAdd /= space;
    }

    if (isGoingUp) {
      if (_currentSliderHeight < maxSliderHeight) {
        _currentSliderHeight += spaceToAdd;
        update();
      }
    }

    if (isGoingDown) {
      if (_currentSliderHeight > minSliderHeight) {
        _currentSliderHeight += spaceToAdd;
        update();
      }
    }

    // The lastAction to do
    lastDyUsed = dy;
  }

  void onVerticalDragEnd(DragEndDetails d) {
    if (!_isNeitherState) return;

    final distanceTop = maxSliderHeight - _currentSliderHeight;

    final distanceBottom = _currentSliderHeight - minSliderHeight;

    if (distanceTop >= distanceBottom) {
      if (distanceTop > 250) {
        _assignAnimationDuration(300);
      } else
        _assignAnimationDuration(100);

      _currentSliderHeight = minSliderHeight;
    } else {
      if (distanceBottom > 250) {
        _assignAnimationDuration(300);
      } else
        _assignAnimationDuration(100);

      _currentSliderHeight = maxSliderHeight;
    }
    update();
  }

  _assignAnimationDuration(int milliseconds) =>
      _animationDuration = Duration(milliseconds: milliseconds);
}
