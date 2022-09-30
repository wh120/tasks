// import 'package:easy_localization/easy_localization.dart';
//
// class Validators {
//   static bool validateImage(String fileName) {
//     if (fileName.toLowerCase().endsWith('png') ||
//         fileName.toLowerCase().endsWith('jpeg') ||
//         fileName.toLowerCase().endsWith('jpg')) {
//       return true;
//     } else
//       return false;
//   }
//
//   static String? validateEmptyValue(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'The text is empty'.tr();
//     }
//     return null;
//   }
//
//   static String? validateEmpty(String? value) {
//     return null;
//   }
//
//   static String? validateMaxValue(String? value, int number) {
//     if (value == null || value.isEmpty) {
//       return 'The text is empty'.tr();
//     } else if (value.length > number) {
//       return 'The text is too long'.tr();
//     }
//     return null;
//   }
//
//   static String? validatePhoneNumber(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'The text is empty'.tr();
//     }
//
//     if (value.length == 10)
//       return null;
//     else if (value.length < 8)
//       return "Please_enter_a_longer_x".tr(args: ['Phone Number'.tr()]);
//     else
//       return "x_must_not_be_longer_than_y_characters"
//           .tr(args: ['Phone Number'.tr(), '8']);
//   }
// }
