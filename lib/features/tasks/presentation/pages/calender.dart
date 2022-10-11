import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';
import 'package:task/core/utils/extensions/style_extension.dart';

import '../../../../core/constants/AppTheme.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/utils/navigation/navigation.dart';
 import '../../data/event_model.dart';
import 'daily_calender.dart';

class Calender extends StatefulWidget {
  final int startMonth;
  final int year;

  const Calender(
      {Key? key,

      this.startMonth = 1,
      required this.year,})
      : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  late DateTime dateTime;


  ValueNotifier<int> lastYear = ValueNotifier<int>(0);

  Widget yearWidget= Container() ;
  @override
  void initState() {
    dateTime = DateTime(widget.year, widget.startMonth, 1);
    lastYear.value =widget.year;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
            valueListenable: lastYear,
            builder: (context, value, child) {
              return Text(value.toString());
            },
        ),
      ),
      body: ListView.builder(
          //itemCount: dateTime.getRemainingMonthCount(),
          itemBuilder: (context, index) {

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  if(dateTime.addMonth(index-1).year != dateTime.addMonth(index).year)
                    buildYear(dateTime.addMonth(index).year),
                    // Text(dateTime.year.toString() , style: AppTheme.headline6,),



                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(dateTime.addMonth(index).printMonth(),
                        style: AppTheme.headline6),
                  ),
                  buildMonthView(dateTime.addMonth(index))
                ],
              ),
            );
          }),
    ).addGradientInWidget();
  }
  Widget buildYear(int year){

    WidgetsBinding.instance.addPostFrameCallback((_) {
      lastYear.value = year;
    });

    return Column(
      children: [
        Divider(),
        Center(child: Text(year.toString() , style: AppTheme.headline6,)),
        Divider(),
      ],
    );
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
        child: Container(
          decoration:date.isSameDate(DateTime.now())? BoxDecoration(
            border: Border.all(
              color: AppColors.primary, //                   <--- border color
              width: 2.0,
            ),
          ):null,

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
                      onTap: ()async {
                        await Navigation.push(DailyCalender(
                          date: date,
                        ));
                        setState(() {});

                      },
                      child: Text(
                        date.day.toString(),
                        style: AppTheme.headline5.copyWith(color: isSelected?Colors.white:null),
                      )),
                ),
              ),
            ),
          ),
        ));
  }
}



