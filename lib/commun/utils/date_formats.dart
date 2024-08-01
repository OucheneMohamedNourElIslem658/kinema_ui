String getTimeRange(DateTime dateTime, int minutesToAdd) {
  DateTime endDateTime = dateTime.add(Duration(minutes: minutesToAdd));
  String startTime =
      '${dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12}:${dateTime.minute.toString().padLeft(2, '0')} ${dateTime.hour >= 12 ? 'PM' : 'AM'}';
  String endTime =
      '${endDateTime.hour % 12 == 0 ? 12 : endDateTime.hour % 12}:${endDateTime.minute.toString().padLeft(2, '0')} ${endDateTime.hour >= 12 ? 'PM' : 'AM'}';
  return '$startTime - $endTime';
}

String addMinutes(DateTime dateTime, int minutesToAdd) {
  DateTime newDateTime = dateTime.add(Duration(minutes: minutesToAdd));
  return formatHour(newDateTime);
}

String formatDateTime(DateTime dateTime) {
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  String dayOfWeek = days[dateTime.weekday - 1];
  String dayOfMonth = dateTime.day.toString().padLeft(2, '0');
  return '$dayOfWeek $dayOfMonth';
}

String formatHour(DateTime dateTime) {
  String hour = dateTime.hour.toString().padLeft(2, '0');
  String minute = dateTime.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

String formatDateTime1(DateTime dateTime) {
  String dayOfWeek = _getDayOfWeek(dateTime.weekday);
  String month = _getMonth(dateTime.month);
  int day = dateTime.day;
  String suffix = _getDaySuffix(day);
  String time = _formatTime(dateTime);

  return '$dayOfWeek, $month $day$suffix at $time';
}

String _getDayOfWeek(int weekday) {
  const daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  return daysOfWeek[weekday - 1];
}

String _getMonth(int month) {
  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  return months[month - 1];
}

String _getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

String _formatTime(DateTime dateTime) {
  int hour = dateTime.hour;
  int minute = dateTime.minute;
  String period = hour >= 12 ? 'PM' : 'AM';

  hour = hour % 12;
  hour = hour == 0 ? 12 : hour; // Convert 0 hour to 12 for 12-hour format

  String minuteStr = minute < 10 ? '0$minute' : '$minute';

  return '$hour:$minuteStr $period';
}

String getMonthAbbreviation(int monthNumber) {
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  return months[monthNumber - 1];
}

String formateDateToString(DateTime date) {
  String formattedDate =
      "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  return formattedDate;
}
