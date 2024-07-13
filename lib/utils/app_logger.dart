import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  /// Log an [object] with [e] and [s] as optional arguments
  static void log(Object? object, {Object? e, StackTrace? s}) {
    if (!kDebugMode) return;
    final logger = Logger();
    logger.d(object, error: e, stackTrace: s);
  }
}
