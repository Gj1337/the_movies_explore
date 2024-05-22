// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

mixin LoggerMixin<T> on BlocBase<T> {
  late final logger = Logger(printer: _MyPrinter(runtimeType.toString()));
}

class _MyPrinter extends LogPrinter {
  _MyPrinter(this.printerName);

  final String printerName;

  @override
  List<String> log(LogEvent event) {
    final isImportant = event.level.value > 3000;

    final text = (kDebugMode || isImportant)
        ? [printerName, event.message.toString(), '\r\n']
        : <String>[];

    return text;
  }
}
