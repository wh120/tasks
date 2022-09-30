import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appcolors.dart';

class AppStyles {
  static double contentVerticalPaddingValue = 1.5.h;
  static double contentHorizontalPaddingValue = 2.5.w;

  static EdgeInsetsGeometry horizontalPadding =
      EdgeInsets.symmetric(horizontal: 5.w);
  static EdgeInsetsGeometry zeroPadding = EdgeInsets.zero;
  static EdgeInsetsGeometry verticalPadding =
      EdgeInsets.symmetric(vertical: 5.w);
  static EdgeInsetsGeometry allPadding =
      EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w);
  static EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(
      vertical: contentVerticalPaddingValue,
      horizontal: contentHorizontalPaddingValue);
  static EdgeInsetsGeometry contentVerticalPadding = EdgeInsets.symmetric(
    vertical: contentVerticalPaddingValue,
  );
  static EdgeInsetsGeometry contentHorizontalPadding =
      EdgeInsets.symmetric(horizontal: contentHorizontalPaddingValue);
  static BorderRadius borderRadius8 = BorderRadius.circular(8);
  static BorderRadius borderRadius = BorderRadius.circular(10);
  static BorderRadius cardRadius = BorderRadius.circular(15);
  static BorderRadius cardRadius20 = BorderRadius.circular(20);
  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: AppColors.grey.shade50.withOpacity(0.3),
      blurRadius: 5,
      offset: const Offset(0.5,0.5),
    ),
  ];

  static List<BoxShadow> secondaryShadow = [
    BoxShadow(
      color: AppColors.greySwatch[20]!,
      blurRadius: 7,
      offset: const Offset(1, 4),
    ),
  ];
  static List<BoxShadow> redShadow = [
    BoxShadow(
      spreadRadius: 0,
      color: AppColors.red,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ];

  static ShapeBorder appBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(30),
    ),
  );

  static Decoration circleImageDecoration = BoxDecoration(
      shape: BoxShape.circle,
      gradient:
          LinearGradient(colors: [AppColors.primary, AppColors.primary[100]!]));
}

const EdgeInsetsGeometry DefaultEdgeInsets = EdgeInsets.all(8);
const Offset offset = const Offset(5, 5);
const double blurRadius = 10;
const Color bottomShadowColor = const Color(0x26234395);
const Color topShadowColor = Colors.white60;

List<BoxShadow> defaultShadow = [
  BoxShadow(
    offset: offset,
    blurRadius: blurRadius,
    color: bottomShadowColor,
  ),
  BoxShadow(
    offset: Offset(-offset.dx, -offset.dx),
    blurRadius: blurRadius,
    color: topShadowColor,
  ),
];
