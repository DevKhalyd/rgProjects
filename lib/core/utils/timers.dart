import 'dart:async';

typedef VoidCallback = Function();

abstract class Timers {
  static execute(VoidCallback onExecution, {int milliseconds = 50}) =>
      Timer(Duration(milliseconds: milliseconds), onExecution);
}
