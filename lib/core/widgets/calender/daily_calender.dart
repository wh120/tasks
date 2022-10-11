import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/app_styles.dart';
import 'package:task/core/constants/appcolors.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';
import 'package:task/core/utils/extensions/style_extension.dart';
import 'package:task/core/widgets/calender/domain/cubits/calender_cubit.dart';

import '../../constants/AppTheme.dart';
import '../../utils/navigation/navigation.dart';
import '../dialogs/dialog.dart';
import '../forms/RoundedDateTimeField.dart';
import '../forms/RoundedTextField.dart';
import '../loading/loading.dart';
import '../scroll_builder/scroll_builder.dart';
import 'AddTaskDialog.dart';
import 'ViewTaskDialog.dart';
import 'data/event_model.dart';

class DailyCalender extends StatefulWidget {
  final DateTime date;

  DailyCalender({Key? key, required this.date}) : super(key: key);

  @override
  State<DailyCalender> createState() => _DailyCalenderState();
}

class _DailyCalenderState extends State<DailyCalender> {
  late int selectedDay;
  late DateTime selectedDateTime ;

  void initState() {
    selectedDateTime =  widget.date;
    selectedDay = widget.date.day;
    BlocProvider.of<CalenderCubit>(context, listen: false).getDayEvents(widget.date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(widget.date.printMonth())),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          await MyDialog.showWidgetDialog(
            body: AddTaskDialog(initialDateTime:selectedDateTime )
            );
          BlocProvider.of<CalenderCubit>(context, listen: false).getDayEvents(selectedDateTime);

        },
        child: const Icon(Icons.add),
      ),
      body: buildBody(),
    ).addGradientInWidget();
  }

  buildBody() {
    return Column(
      children: [
        buildDays(),
        Expanded(child: buildHours())],
    );
  }

  buildDays() {

    return ScrollBuilder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.date.daysInMonth,
        itemBuilder: (c, index) {
          return InkWell(
              onTap: () {
                selectedDateTime = widget.date.setDay(index + 1);
                selectedDay = widget.date.setDay(index + 1).day;
                BlocProvider.of<CalenderCubit>(context, listen: false).getDayEvents(widget.date.setDay(index + 1));
                setState(() {});
              },
              child: buildCard(widget.date.setDay(index + 1),
                  isSelected: selectedDay == widget.date.setDay(index + 1).day));
        });
  }

   buildCard(DateTime dateTime, {bool isSelected = false}) {
    return Container(
      decoration:dateTime.isSameDate(DateTime.now())? BoxDecoration(
        border: Border.all(
          color: AppColors.primary, //                   <--- border color
          width: 2.0,
        ),
      ):null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  dateTime.printDayOFWeek(),
                  style: AppTheme.caption,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : null,
                      // borderRadius: AppStyles.cardRadius100,
                      shape: BoxShape.circle),
                  child: Text(
                    dateTime.day.toString(),
                    style: AppTheme.bodyText1.copyWith(color: isSelected?Colors.white:null),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildHours() {
    DateTime dateTime = selectedDateTime;

    return BlocBuilder<CalenderCubit, CalenderState>(

      builder: (context, state) {
        if (state is GetEventsSuccessfully) {
          return ListView.builder(
              itemCount: 24,
              itemBuilder: (c, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          // textBaseline: TextBaseline.alphabetic,
                          // crossAxisAlignment:  CrossAxisAlignment.baseline,

                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                  dateTime.add(Duration(hours: index)).printTime()),
                            ),
                            Expanded(
                                child: Column(

                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Opacity(
                                  opacity: 0.2,
                                  child: const Divider(
                                    color: AppColors.primary,
                                  ),
                                ),

                              ],
                            )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Opacity(
                              opacity: 0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                    dateTime.add(Duration(hours: index)).printTime()),
                              ),
                            ),
                            Expanded(
                              child: buildEventsInHour(
                                  dateTime.add(Duration(hours: index)) , state.events),
                            ),
                          ],
                        )
                      ],
                    ),

                  ],
                );
              });
        } else
          return const LoadingIndicator();
      },
    );
  }

   Widget buildEventsInHour(DateTime dateTime , List<Event> events) {

     List<Event> hourEvents = events.where((element) => element.dateTime.hour==dateTime.hour).toList();


  if(hourEvents.isEmpty)return  SizedBox( height: 60,);

    return ScrollBuilder(
      withScroll: false,
      scrollDirection: Axis.horizontal,
      itemCount: hourEvents.length,
      itemBuilder: (c, index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Transform.translate(
              offset:  Offset(0.0, hourEvents[index].dateTime.minute.toDouble()+10),
              child: Container(
                height: 60,
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: AppStyles.cardRadius),
                  child: InkWell(
                    onTap: (){
                      MyDialog.showWidgetDialog(body: ViewTaskDialog(event:hourEvents[index] ,)
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        hourEvents[index].name,
                        style: AppTheme.headline6.copyWith(color: Colors.white),
                      ),
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
