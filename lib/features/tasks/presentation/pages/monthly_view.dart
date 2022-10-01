import 'package:flutter/material.dart';
import 'package:task/core/widgets/calender/calender.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/utils/navigation/navigation.dart';
import 'daily_view.dart';


class MonthlyView extends StatelessWidget {
  final DateTime date;
  const MonthlyView({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(date.year.toString()),
      ),
      body: buildBody(),
    );
  }


  Widget buildBody() {
    EventsStore store = EventsStore();
    store.addEvent(DateTime.now(), 'Hi');
    return Calender(
        onDayTap: (date){
          Navigation.push(DailyView(date: date,));
        },
        startMonth: 1,
        year: date.year,
        events: store
    );
  }
}
