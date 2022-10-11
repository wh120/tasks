import 'package:flutter/material.dart';

import '../../constants/app_styles.dart';
import '../../constants/appcolors.dart';



extension StyleExtension on Widget {

  addGradientInWidget( ) {
    return Stack(
      children: [
        this,
        Positioned(
          bottom: -20,
          left: -20,
          child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.5),
                  spreadRadius: 50,
                  blurRadius: 150,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),


          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(

              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary.withOpacity(0.5),
                  spreadRadius: 50,
                  blurRadius: 150,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),


          ),
        ),
      ],
    );
  }

}


