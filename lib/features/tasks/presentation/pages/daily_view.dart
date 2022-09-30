import 'package:flutter/material.dart';
import 'package:task/core/constants/AppTheme.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';

import '../../../../core/widgets/scroll_builder/scroll_builder.dart';

class DailyView extends StatelessWidget {
  final DateTime date;
  const DailyView({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(date.printMonth())),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }

  buildBody() {
    return Column(
      children: [
        buildDays( ),
        FlutterLogo(),
      ],
    );
  }

  buildDays( ) {
    DateTime dateTime = DateTime(date.year , date.month ,1);
    return ScrollBuilder(

        scrollDirection: Axis.horizontal,
        itemCount: dateTime.daysInMonth,
        itemBuilder: (c,index){

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(dateTime.setDay(index+1).printDayOFWeek() , style: AppTheme.caption,),
                Text(dateTime.setDay(index+1).day.toString() , style: AppTheme.bodyText1,),
              ],
            ),
          );
        });
  }
}
