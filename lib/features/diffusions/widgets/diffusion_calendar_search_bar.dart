import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_dropdown_menu.dart';

class DiffusionCalendarSeachBar extends StatelessWidget {
  const DiffusionCalendarSeachBar({
    super.key, 
    required this.halls
  });

  final List<String> halls;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WeekPicker(),
        CustomDropdownMenu(label: "Hall name",items: halls)
      ],
    );
  }
}

class WeekPicker extends StatefulWidget {
  const WeekPicker({super.key});

  @override
  State<WeekPicker> createState() => _WeekPickerState();
}

class _WeekPickerState extends State<WeekPicker> {
  DateTime _currentWeekStart = DateTime.now();

  @override
  void initState() {
    super.initState();
    _currentWeekStart = _getStartOfWeek(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final endOfWeek = _currentWeekStart.add(const Duration(days: 6));
    final weekRange = _formatWeekRange(_currentWeekStart, endOfWeek);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => _changeWeek(-1),
          child: SvgPicture.asset("assets/icons/arrow_back.svg",height: 15),
        ),
        const SizedBox(width: 3),
        InkWell(
          onTap: () => _changeWeek(1),
          child: SvgPicture.asset("assets/icons/arrow_forward.svg",height: 15),
        ),
        const SizedBox(width: 10),
        Text(
          weekRange,
          style: TextStyles.style6,
        ),
      ],
    );
  }

  void _changeWeek(int delta) {
    setState(() {
      _currentWeekStart = _currentWeekStart.add(Duration(days: delta * 7));
    });
  }

  DateTime _getStartOfWeek(DateTime dateTime) {
    final int weekday = dateTime.weekday;
    final int daysToSubtract = (weekday % 7);
    return dateTime.subtract(Duration(days: daysToSubtract));
  }

  String _formatWeekRange(DateTime start, DateTime end) {
    final startDay = start.day;
    final startMonth = start.month;
    final startYear = start.year;
    final endDay = end.day;
    final endMonth = end.month;
    final endYear = end.year;

    final startMonthName = _monthName(startMonth);
    final endMonthName = _monthName(endMonth);

    if (startYear == endYear) {
      if (startMonth == endMonth) {
        return '${startDay.toString().padLeft(2, '0')}-${endDay.toString().padLeft(2, '0')} $endMonthName $endYear';
      } else {
        return '${startDay.toString().padLeft(2, '0')} $startMonthName - ${endDay.toString().padLeft(2, '0')} $endMonthName $endYear';
      }
    } else {
      return '${startDay.toString().padLeft(2, '0')} $startMonthName $startYear - ${endDay.toString().padLeft(2, '0')} $endMonthName $endYear';
    }
  }

  String _monthName(int month) {
    switch (month) {
      case 1: return 'January';
      case 2: return 'February';
      case 3: return 'March';
      case 4: return 'April';
      case 5: return 'May';
      case 6: return 'June';
      case 7: return 'July';
      case 8: return 'August';
      case 9: return 'September';
      case 10: return 'October';
      case 11: return 'November';
      case 12: return 'December';
      default: return '';
    }
  }
}