import 'dart:math';

final _random = Random();

abstract class Logical {
  static double generateDouble() => _random.nextDouble();
}
