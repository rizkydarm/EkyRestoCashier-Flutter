import 'package:talker/talker.dart';

final talker = Talker();

void talkerInfoDB(String message) {
  talker.logCustom(TalkerLog(
    message,
    title: 'Database',
    logLevel: LogLevel.info,
    pen: AnsiPen()..yellow()
  ));
}
