import 'dart:async';

typedef VoidCallback = Function();

class Debouncer {
  final int milliseconds;
  Timer? timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback callback) {
    if (timer != null) timer!.cancel();
    timer = Timer(Duration(milliseconds: milliseconds), callback);
  }
}
