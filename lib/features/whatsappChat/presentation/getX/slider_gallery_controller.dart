import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/utils/debouncer.dart';

import '../../../../core/utils/logger.dart';

const _debouncerMilliseconds = 20;

/// Handle the gallery menu in the phone
class SliderGalleryController extends GetxController {
  static SliderGalleryController get to => Get.find();

  final _d = Debouncer(milliseconds: _debouncerMilliseconds);

  /// The _maxHeight in the screen
  late double _maxHeight;

  /// The _status bar size
  late double _paddingTop;

  /// The lesser value of the dy
  ///
  /// Example: 600 could be the min and the max could be 100 or less
  double? _minDy;

  /// The last dy used in the LongPressMovedUp
  double? _lastDy;

  Duration _animationDuration = Duration(milliseconds: 300);

  // NOTE: IF the space needed to change is greater than 4 the time should change
  Duration get animationDuration => _animationDuration;

  double get _minSliderHeight {
    return _maxHeight * .33;
  }

  double get _maxSliderHeight {
    return _maxHeight - _paddingTop;
  }

  bool get _isClosedSlider {
    return _currentSliderHeight == _minSliderHeight;
  }

  bool get _isOpenSlider {
    return _currentSliderHeight == _maxSliderHeight;
  }

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
    _currentSliderHeight = _minSliderHeight;
  }

  void onTap() {
    _assignAnimationDuration(400);
    if (_currentSliderHeight == _maxSliderHeight)
      _currentSliderHeight = _minSliderHeight;
    else if (_currentSliderHeight == _minSliderHeight)
      _currentSliderHeight = _maxSliderHeight;
    update();
  }

  double? lastDyUsed;

  /// The minDy to use in the animation
  double? minDy;

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
      if (_currentSliderHeight < _maxSliderHeight) {
        _currentSliderHeight += spaceToAdd;
        update();
      }
    }

    if (isGoingDown) {
      if (_currentSliderHeight > _minSliderHeight) {
        _currentSliderHeight += spaceToAdd;
        update();
      }
    }

    // The lastAction to do
    lastDyUsed = dy;
  }

  void onVerticalDragEnd(DragEndDetails d) {
    if (!_isNeitherState) return;

    final distanceTop = _maxSliderHeight - _currentSliderHeight;

    final distanceBottom = _currentSliderHeight - _minSliderHeight;

    if (distanceTop >= distanceBottom) {
      if (distanceTop > 250) {
        _assignAnimationDuration(300);
      } else
        _assignAnimationDuration(100);

      _currentSliderHeight = _minSliderHeight;
    } else {
      if (distanceBottom > 250) {
        _assignAnimationDuration(300);
      } else
        _assignAnimationDuration(100);

      _currentSliderHeight = _maxSliderHeight;
    }
    update();
  }

  _assignAnimationDuration(int milliseconds) =>
      _animationDuration = Duration(milliseconds: milliseconds);
}
