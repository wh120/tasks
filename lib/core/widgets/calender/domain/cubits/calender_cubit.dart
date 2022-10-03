import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../data/event_model.dart';

part 'calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderInitial());

  getDayEvents(DateTime dateTime)async{
    emit(GetEventsLoading());
    await Future.delayed(Duration(seconds: 1));
    List<Event> events =   GetIt.I<EventsStore>().getDayEvents(dateTime);
    emit(GetEventsSuccessfully(events));
  }

  addEvent(Event event)async{
     GetIt.I<EventsStore>().addEvent(event.dateTime , event.name);
   }
}
