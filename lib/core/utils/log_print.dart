import 'package:logger/logger.dart';

class LogPrint {
  // Strict boolean to control logging, cannot be changed externally
  static const bool _isLoggingEnabled = true;

  // Customize logger with level-specific colors
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      colors: true,
      printEmojis: true,
      levelColors: {
        Level.verbose: AnsiColor.fg(AnsiColor.grey(0.5)), // Abu-abu
        Level.debug: AnsiColor.fg(34), // Biru untuk debug
        Level.info: AnsiColor.fg(32), // Hijau untuk info
        Level.warning: AnsiColor.fg(33), // Kuning untuk warning
        Level.error: AnsiColor.fg(196), // Merah terang untuk error
        Level.wtf: AnsiColor.fg(199), // Merah tua untuk fatal
      },
    ),
  );

  // Logger without stacktrace, used for concise logs
  static final Logger _loggerNoStack = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      printEmojis: true,
      levelColors: {
        Level.verbose: AnsiColor.fg(AnsiColor.grey(0.5)), // Abu-abu
        Level.debug: AnsiColor.fg(34), // Biru untuk debug
        Level.info: AnsiColor.fg(32), // Hijau untuk info
        Level.warning: AnsiColor.fg(33), // Kuning untuk warning
        Level.error: AnsiColor.fg(196), // Merah terang untuk error
        Level.wtf: AnsiColor.fg(199), // Merah tua untuk fatal
      },
    ),
  );

  // Override the print function
  static void print(String message) {
    if (_isLoggingEnabled) {
      _loggerNoStack.i(message);
    }
  }

  static void debug(String message) {
    if (_isLoggingEnabled) {
      _logger.d(message);
    }
  }

  static void info(String message) {
    if (_isLoggingEnabled) {
      _loggerNoStack.i(message);
    }
  }

  static void warn(String message) {
    if (_isLoggingEnabled) {
      _loggerNoStack.w(message);
    }
  }

  static void error(String message, {dynamic error}) {
    if (_isLoggingEnabled) {
      _logger.e(message, error: error);
    }
  }

  static void trace(dynamic message) {
    if (_isLoggingEnabled) {
      _loggerNoStack.t(message);
    }
  }

  static void exception(Object exception, StackTrace stackTrace, Object caller,
      [String? methodName = '']) {
    String className = caller.runtimeType.toString();

    LogPrint.error(
      'Exception at $className-$methodName: $exception, $stackTrace',
    );
  }
}
