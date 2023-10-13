import 'package:logger/logger.dart';

class LoggingService {
  late Logger logger;

  LoggingService() {
    logger = Logger(printer: PrettyPrinter(colors: false, methodCount: 0));
  }

  // These just passthrough to our underlying logger for now.
  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.log(Level.debug, message, error: error, stackTrace: stackTrace);
  }

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.log(Level.error, message, error: error, stackTrace: stackTrace);
  }

  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.log(Level.info, message, error: error, stackTrace: stackTrace);
  }

  void verbose(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.log(Level.trace, message, error: error, stackTrace: stackTrace);
  }

  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.log(Level.warning, message, error: error, stackTrace: stackTrace);
  }

  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.log(Level.fatal, message, error: error, stackTrace: stackTrace);
  }
}
