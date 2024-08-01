import 'package:flutter/material.dart';
import 'package:kinema/commun/models/movie.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/utils/date_formats.dart';

class SelectedHoleTimes extends StatefulWidget {
  const SelectedHoleTimes({
    super.key,
    required this.movie,
    this.onHoleTimeChanged
  });
  final Movie movie;
  final Function(DateTime date,int duration)? onHoleTimeChanged;

  @override
  State<SelectedHoleTimes> createState() => _SelectedHoleTimesState();
}

class _SelectedHoleTimesState extends State<SelectedHoleTimes> {
  @override
  void initState() {
    initShowTimes(widget.movie.showTime);
    super.initState();
  }

  List<Map<String,dynamic>> holeReservationTimes = [];

  void initShowTimes(List<DateTime> showTimes) {
    for (var i = 0; i < showTimes.length; i++) {
      final time = showTimes[i];
      holeReservationTimes.add({
        'day': formatDateTime(time),
        'time': '${formatHour(time)}-${addMinutes(time, widget.movie.time.toInt())}',
        'isSelected': i == 0 ? true : false
      });
    }
    setState(() {});
  }

  void selectHoleTime(int index) {
    for (var i = 0; i < holeReservationTimes.length; i++) {
      if (i == index) {
        holeReservationTimes[i]['isSelected'] = true;
      } else {
        holeReservationTimes[i]['isSelected'] = false;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 50,
        child: Row(
          children: List.generate(
            holeReservationTimes.length, 
            (index) {
              final holeReservation = holeReservationTimes[index];
              final day = holeReservation['day'] as String;
              final time = holeReservation['time'] as String;
              final isSelected = holeReservation['isSelected'] as bool;
              return Padding(
                padding: const EdgeInsets.only(right: 30),
                child: GestureDetector(
                  onTap: () {
                    selectHoleTime(index);
                    widget.onHoleTimeChanged != null
                      ? widget.onHoleTimeChanged!(
                        widget.movie.showTime[index],
                        widget.movie.time.toInt()
                      )
                      :null;
                  },
                  child: HoleReservationItem(
                    isSelected: isSelected, 
                    day: day,
                    time: time
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

class HoleReservationItem extends StatelessWidget {
  const HoleReservationItem({
    super.key,
    required this.isSelected,
    required this.day,
    required this.time,
  });

  final bool isSelected;
  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 100),
      style: const TextStyle(fontSize: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 100),
            style: isSelected ? TextStyles.style13 : TextStyles.style14,
            child: Text(day)
          ),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 100),
            style: isSelected ? TextStyles.style6.copyWith(
              color: CustomColors.white,
              height: 0.4
            ) : TextStyles.style15.copyWith(
              height: 0.4
            ),
            child: Text('\n$time',)
          )
        ],
      )
    );
  }
}