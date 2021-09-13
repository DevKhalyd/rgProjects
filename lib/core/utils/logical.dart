import 'dart:math';

final _random = Random();

abstract class Logical {
  static double generateDouble() => _random.nextDouble();
  static int generateInt({int max = 100}) => _random.nextInt(max);
}
