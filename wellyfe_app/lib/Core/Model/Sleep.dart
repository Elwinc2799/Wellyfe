import 'package:intl/intl.dart';

class Sleep {
  final double sleepDuration;
  final double awakeDuration;
  final DateTime dateRecorded;

  Sleep(
    this.sleepDuration,
    this.awakeDuration,
    this.dateRecorded,
  );

  static List<Sleep> sleepDataList = [];
  static double averageSleep = 0;

  static Sleep getPreviousSleepData() {
    return sleepDataList.firstWhere(
      (element) => convert(element.dateRecorded.toString()) == convert(DateTime.now().subtract(Duration(days:1)).toString()),
        orElse: () => Sleep(0, 0, DateTime.now().subtract(Duration(days: 1)))
    );
  }

  static String convert(String date) {
    final DateFormat displayFormat = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormat = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormat.parse(date);
    final String formatted = serverFormat.format(displayDate);
    return formatted;
  }
}