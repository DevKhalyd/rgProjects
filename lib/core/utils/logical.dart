import 'dart:math';

import 'dart:ui';

const _limit = 360.0;
final _random = Random();

abstract class Logical {
  static double generateDouble() => _random.nextDouble();

  static int generateInt({int max = 100}) => _random.nextInt(max);

  /// [initial] the value from 1 to 359. See: https://en.wikipedia.org/wiki/Hue
  ///
  /// [t] the value from 0 to 1. Use common with AnimationController.
  ///
  /// [remaining] a parameter needed to help the recursion in this function. Don't use.
  static double getHue(
      {required int initial, required double t, int? remaining}) {
    assert(initial > 0 && initial <= 359);

    if (remaining != null) return remaining.toDouble();

    final eD = lerpDouble(0, 360, t)!;

    final newValue = initial + eD;

    if (newValue <= _limit) return newValue;

    return getHue(
      initial: initial,
      t: t,
      remaining: (newValue - _limit).toInt(),
    );
  }
}
