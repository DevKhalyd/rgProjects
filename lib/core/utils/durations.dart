abstract class Durations {
  static const fiftyMilliseconds = Duration(milliseconds: 50);
  static const defaultAnimation = Duration(milliseconds: 250);
  static const zero = Duration.zero;

  static Duration getDurationInMilliseconds(int milliseconds) =>
      Duration(milliseconds: milliseconds);
}
