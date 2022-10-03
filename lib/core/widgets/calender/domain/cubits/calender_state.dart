part of 'calender_cubit.dart';

@immutable
abstract class CalenderState {}

class CalenderInitial extends CalenderState {}

class GetEventsLoading extends CalenderState {}

class GetEventsSuccessfully extends CalenderState {
  final List<Event> events;

  GetEventsSuccessfully(this.events);
}


class CreateEventsLoading extends CalenderState {}

class CreateEventSuccessfully extends CalenderState {

}