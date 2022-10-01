import 'package:get_it/get_it.dart';
import 'package:task/core/widgets/calender/data/event_model.dart';


class ServiceLocator {

  static void registerModels() {
    GetIt.I.registerLazySingleton<EventsStore>(() => EventsStore());
  }



}

