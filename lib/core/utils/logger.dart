import 'package:logger/logger.dart';

enum L { V, D, I, W, E, WTF }

class Log {
  // ! output: null, Use the default LogOutput (-> send everything to console). Shake the phone to send the info to the phone
  //Use for info,warning and WTF
  static final _printerDefault = PrettyPrinter(
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      methodCount: 0);

  static final _printer = PrettyPrinter(
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: true,
      errorMethodCount: 6,
      methodCount: 2);

  static final _loggerDefault = Logger(printer: _printerDefault);
  static final _logger = Logger(printer: _printer);

  static void console(message, [L s = L.I, error, stackTrace]) {
    switch (s) {
      case L.I:
        _loggerDefault.i(message, error, stackTrace);
        break;
      case L.W:
        _loggerDefault.w(message, error, stackTrace);
        break;
      case L.WTF:
        _loggerDefault.wtf(message, error, stackTrace);
        break;
      case L.E:
        _logger.e(message, error, stackTrace);
        break;
      case L.V:
        _logger.v(message, error, stackTrace);
        break;
      case L.D:
        _logger.d(message, error, stackTrace);
        break;
      default:
        throw new UnimplementedError('Missing method');
    }
  }
}
