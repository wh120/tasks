
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../constants/Keys.dart';
import '../../constants/appcolors.dart';

class Navigation {
  static Future? popThenPush(Widget page) async {
    Navigation.pop();
    return await Navigation.push(page);
  }

  static Future? push(Widget page) async {
    if (Keys.navigatorKey.currentContext != null)
      return await Navigator.push(
        Keys.navigatorKey.currentContext!,
        CupertinoPageRoute(builder: (context) => page),
      );
  }

  static pop({dynamic value}) async {
    Navigator.pop(Keys.navigatorKey.currentContext!, value);
  }

  static Future? pushReplacement(Widget page) async {
    while (Navigator.canPop(Keys.navigatorKey.currentContext!)) {
      Navigation.pop();
    }
    return await Navigator.pushReplacement(
      Keys.navigatorKey.currentContext!,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  static Future? pushAndRemoveUntil(Widget page) async {
    return await Navigator.pushAndRemoveUntil(
        Keys.navigatorKey.currentContext!,
        CupertinoPageRoute(builder: (BuildContext context) => page),
            (Route<dynamic> route) => false);
  }



  static showBottomSheet({Widget? child}) async {
    return await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 30,
        enableDrag: true,
        isScrollControlled: true,
        context: Keys.navigatorKey.currentContext!,
        useRootNavigator: true,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Color.fromARGB(182, 182, 182, 182)],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 0.5),
                stops: [0.0, 1.0],
                // tileMode: TileMode.decal
              ),
            ),
        //    height: 75.h,
            child:

            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 5,
                ),
                Divider(
                  // indent: 45.w,
                  // endIndent: 45.w,
                  thickness: 3,
                  color: Colors.grey,
                ),
                Expanded(
                  child: SingleChildScrollView(child: child ?? Container()),
                ),
                // ),
              ],
            ),
          );
        });
  }


}
