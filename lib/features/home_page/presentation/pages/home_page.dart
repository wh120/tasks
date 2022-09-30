import 'package:flutter/material.dart';

import '../../../../core/utils/navigation/navigation.dart';
import '../../../tasks/presentation/pages/monthly_view.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {

    return ListView.builder(
        itemBuilder: (context, index) {
         DateTime date =DateTime(dateTime.year+index, dateTime.month  , dateTime.day);
          return ListTile(
            onTap: () {
               Navigation.push(MonthlyView(
                 date: date,
               ));
            },
            leading: Icon(Icons.date_range),
            title: Text(date.year.toString()),);
        },
    );
  }
}
