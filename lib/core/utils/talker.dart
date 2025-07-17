import 'package:talker/talker.dart';

final talker = Talker(settings: TalkerSettings(
  enabled: false
));

void talkerInfoDB(String message) {
  talker.logCustom(TalkerLog(
    message,
    title: 'Database',
    logLevel: LogLevel.info,
    pen: AnsiPen()..yellow()
  ));
}
