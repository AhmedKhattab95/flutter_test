


import 'package:flutter_sample/core/logger/logger_lib.dart';
import 'package:flutter_sample/core/logger/models/log_level_enum.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ConsoleLogger consoleLogger;
  setUp(() {
    consoleLogger = ConsoleLogger();
  });
  group('ConsoleLogger', () {
    test('log method should return the same', () {
      var logData = LogData(LogLevelEnum.info, "test message");

      var result = consoleLogger.log(logData);
      expect(result, logData.toString());
    });

    test('log method should print the same', () {
      var logData = LogData(LogLevelEnum.info, "test print message");

      expect(() => consoleLogger.log(logData), prints("${logData.toString()}\n"));
    });
  });
}
