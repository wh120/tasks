import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task/start_up.dart';


import 'core/constants/AppTheme.dart';
import 'core/constants/Keys.dart';
import 'features/home_page/presentation/pages/home_page.dart';

void main() async{
  await StartUp.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      navigatorKey: Keys.navigatorKey,
      theme: AppTheme.theme,
      title: 'Tasks app',
      home: const HomePage( ),
    );
  }
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}