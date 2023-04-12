
import 'log_level_enum.dart';

class LogData {
  LogLevelEnum logLevel;
  String logText;

  LogData(this.logLevel, this.logText);

  @override
  String toString() {
    return "${logLevel.name}: $logText";
  }
}
