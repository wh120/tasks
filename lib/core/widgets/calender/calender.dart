import 'package:flutter/material.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';

import '../../constants/AppTheme.dart';
import '../../constants/appcolors.dart';

class Calender extends StatefulWidget {
  final int startMonth;
  final int year;
  final ValueChanged<DateTime> onDayTap;

  final EventsStore events;
  const Calender(
      {Key? key,
      required this.events,
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
    eventList = widget.events.getEvents(date);

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
            child: ClipOval(
              child: Container(
                color: isSelected?AppColors.primary:null,
                child: Padding(
                  padding: const EdgeInsets.all( 7),
                  child: InkWell(
                      onTap: () {
                        widget.onDayTap(date);
                      },
                      child: Text(
                        date.day.toString(),
                        style: AppTheme.headline5,
                      )),
                ),
              ),
            ),
          ),
        ));
  }
}

class Event {
  final DateTime dateTime;
  final Color? color;
  final String name;

  Event({required this.name, required this.dateTime, this.color});
}

class EventsStore{
   Map<String,Map<String,List<Event>>> _events={};

   addEvent(DateTime dateTime , String name){
    Event event =Event(
        name: name,
        dateTime: dateTime,
        color: AppColors.primary
    );
    if(_events.containsKey(dateTime.year.toString())){

      if(_events[dateTime.year.toString()]!.containsKey(dateTime.month.toString())){
        _events[dateTime.year.toString()]![dateTime.month.toString()]!.add(event);
      }else{
        _events[dateTime.year.toString()]!.putIfAbsent(dateTime.month.toString(), () => [event]);
      }
    }
    else{
      _events.putIfAbsent(dateTime.year.toString(), () => {
        dateTime.month.toString():[event]
      });
    }
  }

   List<Event> getEvents(DateTime dateTime){
    if(_events.containsKey(dateTime.year.toString())){
      if(_events[dateTime.year.toString()]!.containsKey(dateTime.month.toString())) {
        List<Event> list  = _events[dateTime.year.toString()]![ dateTime.month.toString()]!;
        return list;
      } else {
        return [];
      }
    }
    else return [];
  }

}

