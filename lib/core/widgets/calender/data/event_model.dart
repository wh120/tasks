import 'package:flutter/material.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';

import '../../../constants/appcolors.dart';

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

  List<Event> getMonthEvents(DateTime dateTime){
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

  List<Event> getDayEvents(DateTime dateTime){
    if(_events.containsKey(dateTime.year.toString())){
      if(_events[dateTime.year.toString()]!.containsKey(dateTime.month.toString())) {
        List<Event> list  = _events[dateTime.year.toString()]![ dateTime.month.toString()]!;
        return list.where((element) => element.dateTime.isSameDate(dateTime)).toList();
      } else {
        return [];
      }
    }
    else return [];
  }

}