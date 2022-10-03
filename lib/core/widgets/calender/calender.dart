import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';

import '../../constants/AppTheme.dart';
import '../../constants/appcolors.dart';
import '../../utils/navigation/navigation.dart';
import 'daily_calender.dart';
import 'data/event_model.dart';

class Calender extends StatefulWidget {
  final int startMonth;
  final int year;
  final ValueChanged<DateTime> onDayTap;


  const Calender(
      {Key? key,

      this.startMonth = 1,
      required this.year,
      required this.onDayTap})
      : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  late DateTime dateTime;


  @override
  void initState() {
    dateTime = DateTime(widget.year, widget.startMonth, 1);

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(


        itemCount: dateTime.getRemainingMonthCount(),
        itemBuilder: (context, index) {



          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(dateTime.addMonth(index).printMonth(),
                      style: AppTheme.headline6),
                ),
                buildMonthView(dateTime.addMonth(index))
              ],
            ),
          );
        });
  }

  buildMonthView(DateTime date) {
    List<Event> eventList =[];
    ///todo add state management
    eventList = GetIt.I<EventsStore>().getMonthEvents(date);

    List<Widget> dayNames = List.generate(7, (index) {
      return Center(child: Text(date.days[date.firstWeekDayOfMonth() + index]));
    });

    List<List<DateTime?>> weeks = date.getWeeks();

    List<TableRow> weekRows = List.generate(weeks.length, (i) {
      return TableRow(
          children: List.generate(weeks[i].length, (index) {
        if (weeks[i][index] == null) return Text('');
        return buildTableCell(weeks[i][index]! , isSelected: eventList.where((element) => element.dateTime.isSameDate(weeks[i][index]!)).length>0);
      }));
    });

    weekRows.insert(0, TableRow(children: dayNames));

    return Table(
      border: TableBorder(
          horizontalInside: BorderSide(
        width: 0.6,
        color: AppColors.grey[20]!,
      )),
      children: weekRows,
    );
  }

  Widget buildTableCell(DateTime date , {bool isSelected = false}) {
    return TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : null,
                  // borderRadius: AppStyles.cardRadius100,
                  shape: BoxShape.circle),


              child: Padding(
                padding: const EdgeInsets.all( 7),
                child: InkWell(
                    onTap: () {
                      Navigation.push(DailyCalender(
                        date: date,

                      ));
                      widget.onDayTap(date);
                    },
                    child: Text(
                      date.day.toString(),
                      style: AppTheme.headline5,
                    )),
              ),
            ),
          ),
        ));
  }
}



