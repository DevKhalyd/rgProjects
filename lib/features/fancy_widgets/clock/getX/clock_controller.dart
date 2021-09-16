import 'dart:async';

import 'package:get/get.dart';

class ClockController extends GetxController {
  int _hour = 0;
  int _minute = 0;
  int _second = 0;

  /// AM or PM
  String _time = "";

  String currentTime = "Loading...";

  @override
  void onInit() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      final t = DateTime.now();
      _hour = t.hour;
      _minute = t.minute;
      _second = t.second;
      _time = "AM";
      if (_hour >= 12) {
        _time = "PM";
        if (_hour > 12) {
          final newData = _hour - 12;
          _hour = newData;
        }
      }

      String h = _hour.toString();
      String m = _minute.toString();
      String s = _second.toString();

      if (_hour < 10) h = '0$h';
      if (_minute < 10) m = '0$m';
      if (_second < 10) s = '0$s';

      currentTime = '$h : $m : $s : $_time';
      update();
    });
    super.onInit();
  }
}
