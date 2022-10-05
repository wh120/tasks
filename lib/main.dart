import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/start_up.dart';


import 'core/constants/AppTheme.dart';
import 'core/constants/Keys.dart';
import 'core/widgets/calender/domain/cubits/calender_cubit.dart';
import 'features/home_page/presentation/pages/home_page.dart';
import 'features/tasks/presentation/pages/monthly_view.dart';

void main() async{
  await StartUp.setup();
  runApp(const BlocProviderWidget());
}

class BlocProviderWidget extends StatelessWidget {
  const BlocProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalenderCubit>(
          create: (BuildContext context) => CalenderCubit(),
        ),

      ],
      child: MyApp(),
    );
  }
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
      home:   MonthlyView( date:  DateTime.now(), ),
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