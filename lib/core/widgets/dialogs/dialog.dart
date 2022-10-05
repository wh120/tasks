import 'package:flutter/material.dart';


import '../../constants/AppTheme.dart';
import '../../constants/Keys.dart';
import '../../constants/appcolors.dart';
import '../../utils/navigation/navigation.dart';
import '../forms/RoundedDateTimeField.dart';
import '../forms/RoundedTextField.dart';

class MyDialog {
  static showConfirmDialog(
      {required String title, Widget? body, required VoidCallback onConfirm}) {
    showDialog(
        context: Keys.navigatorKey.currentContext!,
        builder: (_) => Stack(
          alignment: Alignment.center,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(


                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                        child: InkWell(
                            onTap: () {
                              Navigation.pop();
                              onConfirm();
                              //    deleteMyAccountCubit.createModel(null);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFF10B894),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color.fromRGBO(
                                        16, 35, 119, 0.4),
                                  ),
                                ],
                                borderRadius:
                                BorderRadius.circular(50),
                              ),
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                    fontSize: 8,
                                    color: AppColors.white,
                                    decoration: TextDecoration.none),
                              ),
                            ))),
                    SizedBox(
                      width: 8,
                    ),
                    Material(
                        child: InkWell(
                            onTap: () {
                              Navigation.pop();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFE54B4B),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color.fromRGBO(
                                        16, 35, 119, 0.4),
                                  ),
                                ],
                                borderRadius:
                                BorderRadius.circular(50),
                              ),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 8,
                                    color: AppColors.white,
                                    decoration: TextDecoration.none),
                              ),
                            )))
                  ],
                )
              ],
            ),
          ],
        ));

  }

  static showWidgetDialog(
      { required Widget body}) {

    return showDialog(
        context: Keys.navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),

            content: SingleChildScrollView(
              child: body,
            ),
          );
        });



  }
}
