import 'logger.dart';
import 'models/logData.dart';

class ConsoleLogger implements Logger {
  @override
  String log(LogData logData) {
    print(logData.toString());
    return logData.toString();
  }

}