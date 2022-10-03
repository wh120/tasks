import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';
import 'package:task/core/widgets/calender/calender.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/utils/navigation/navigation.dart';
import '../../../../core/widgets/calender/data/event_model.dart';


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
    return Calender(
        startMonth: 1,
        year: date.year,
    );
  }
}
