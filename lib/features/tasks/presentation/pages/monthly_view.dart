import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';
import 'package:task/features/tasks/presentation/pages/calender.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/utils/navigation/navigation.dart';
import '../../data/event_model.dart';


class MonthlyView extends StatelessWidget {

  const MonthlyView({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }


  Widget buildBody() {
    return Calender(
        startMonth: 1,
        year: DateTime.now().year,
    );
  }
}
