class Streams {
  Stream<HourMinute> timedCounter(HourMinute time) async* {
    int second = int.tryParse(time.second) ?? 0;
    int minute = time.minute;
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      final newValue = second++;
      if (newValue == 59) {
        second = 0;
        minute++;
      }
      final useSecond = second < 10 ? '0$second' : second.toString();
      yield HourMinute(minute: minute, second: useSecond);
    }
  }
}

class HourMinute {
  const HourMinute({
    required this.minute,
    required this.second,
  });

  const HourMinute.zero([this.minute = 0, this.second = '00']);

  final int minute;
  final String second;
}
