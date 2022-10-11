import 'package:get_it/get_it.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';
import 'package:task/features/tasks/data/event_model.dart';


class ServiceLocator {

  static void registerModels() {
    GetIt.I.registerLazySingleton<EventsStore>(() => EventsStore());

    EventsStore store =  GetIt.I<EventsStore>();
    store.addEvent(DateTime.now(), 'Task title');
    store.addEvent(DateTime.now().nextDay(), 'Task title');

  }



}

