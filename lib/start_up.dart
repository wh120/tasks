

import 'core/utils/service_locator/ServiceLocator.dart';



class StartUp {
  static Future<void> setup() async {

    ServiceLocator.registerModels();

  }
}
