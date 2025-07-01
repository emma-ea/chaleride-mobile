import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 2,
    lineLength: 150,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.dateAndTime
  ),
  level: kReleaseMode ? Level.off : null,
);