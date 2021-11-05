import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DayTimestamp {
  String getDayFromTimestamp(int timestamp, context) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var t = AppLocalizations.of(context);
    switch (date.weekday) {
      case 1:
        return t!.monday;
      case 2:
        return t!.tuesday;
      case 3:
        return t!.wednesday;
      case 4:
        return t!.thursday;
      case 5:
        return t!.friday;
      case 6:
        return t!.saturday;
      case 7:
        return t!.sunday;
      default:
        return t!.monday;
    }
  }
}
