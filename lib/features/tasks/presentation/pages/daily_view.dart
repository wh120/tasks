import 'package:flutter/material.dart';
import 'package:task/core/constants/AppTheme.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';

import '../../../../core/widgets/calender/daily_calender.dart';
import '../../../../core/widgets/calender/data/event_model.dart';
import '../../../../core/widgets/scroll_builder/scroll_builder.dart';

class DailyView extends StatelessWidget {
  final DateTime date;
  final EventsStore store;
  const DailyView({Key? key, required this.date, required this.store}) : super(key: key);

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
        DailyCalender(
          date: date,
          store: store,
        ),
        FlutterLogo(),
      ],
    );
  }


}
