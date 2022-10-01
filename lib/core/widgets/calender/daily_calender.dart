import 'package:flutter/material.dart';
import 'package:task/core/constants/appcolors.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';

import '../../constants/AppTheme.dart';
import '../scroll_builder/scroll_builder.dart';
import 'data/event_model.dart';

class DailyCalender extends StatefulWidget {
  final DateTime date;
  final EventsStore store;
   DailyCalender({Key? key, required this.date, required this.store}) : super(key: key);

  @override
  State<DailyCalender> createState() => _DailyCalenderState();
}

class _DailyCalenderState extends State<DailyCalender> {
  late int selectedDay ;

  void initState() {
    selectedDay = widget.date.day;

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.date.printMonth())),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      body: buildBody(),
    );
  }
  buildBody(){
    return Column(
      children: [
        buildDays()
      ],
    );
  }

  buildDays( ) {

    DateTime dateTime = DateTime(widget.date.year , widget.date.month ,1);
    return ScrollBuilder(

        scrollDirection: Axis.horizontal,
        itemCount: dateTime.daysInMonth,
        itemBuilder: (c,index){

          return InkWell(
              onTap: (){
                selectedDay = dateTime.setDay(index+1).day;
                setState(() {});
              },
              child: buildCard(dateTime.setDay(index+1) , isSelected: selectedDay==dateTime.setDay(index+1).day));
        });
  }

  Padding buildCard(DateTime dateTime , {bool isSelected= false}) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color:isSelected? AppColors.primary:null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(dateTime.printDayOFWeek() , style: AppTheme.caption,),
                  Text(dateTime.day.toString() , style: AppTheme.bodyText1,),
                ],
              ),
            ),
          ),
        );
  }
}
