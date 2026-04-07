import 'package:flutter/widgets.dart';
import 'package:rearch/rearch.dart';
import 'package:logging/logging.dart';

extension AsyncValueExtension<T> on AsyncValue<T> {
  Widget toWidget({
    required Widget Function(T data) data,
    required Widget Function() loading,
    required Widget Function(Object error, StackTrace? stack) error,
  }) {
    return switch (this) {
      AsyncData(data: final v) => data(v),
      AsyncLoading() => loading(),
      AsyncError(error: final e, stackTrace: final s) => error(e, s),
    };
  }
}

// Logger implementation
class AppLogger {
  static final Logger _logger = Logger('ReArchDemo');

  static void init() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
// ignore: avoid_print
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  static Logger get logger => _logger;
}