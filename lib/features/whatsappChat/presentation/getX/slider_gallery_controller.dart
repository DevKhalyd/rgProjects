import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/utils/logger.dart';

/// Handle the gallery menu in the phone
class SliderGalleryController extends GetxController {
  static SliderGalleryController get to => Get.find();

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

  void onLongPressMoveUpdate(LongPressMoveUpdateDetails d) {
    //NOTE: Check if this one is used
    //final minDy = _assignDyIfNeeded(dy);
    final globalPosition = d.globalPosition;
    final dy = globalPosition.dy;
    final lastDy = _lastDy ?? dy;

    /// This value can be positive or negative
    double extraHeight = 0;

    Log.console(dy);

    // Going up
    if (dy < lastDy)
      extraHeight = 2.7;
    // Going down
    else if (dy > lastDy) extraHeight = -2.7;

    if (_lastDy != null) if (lastDy == dy) return;

    _updateSlider(extraHeight);
    _assignLastDyUsed(dy);
  }

  void onLongPressEnd(LongPressEndDetails d) {
    if (!_isNeitherState) return;

    final distanceTop = _maxSliderHeight - _currentSliderHeight;

    final distanceBottom = _currentSliderHeight - _minSliderHeight;
    if (distanceTop >= distanceBottom)
      _currentSliderHeight = _minSliderHeight;
    else
      _currentSliderHeight = _maxSliderHeight;
    update();
  }

  _updateSlider(double v) {
    if (v == 0) return;
    _currentSliderHeight += v;
    if (_currentSliderHeight <= _minSliderHeight + 25 ||
        _currentSliderHeight >= _maxSliderHeight) return;
    update();
  }

  _assignAnimationDuration(int milliseconds) =>
      _animationDuration = Duration(milliseconds: milliseconds);

  /// Just assign the `_minDy`
  /// and then return the current value of `_minDy`
  double _assignDyIfNeeded(double dy) {
    if (_minDy == null) {
      _minDy = dy;
      return _minDy!;
    }
    if (dy > _minDy!) _minDy = dy;
    return _minDy!;
  }

  /// Assign the `_lastDy` used
  _assignLastDyUsed(double dy) => _lastDy = dy;
}
