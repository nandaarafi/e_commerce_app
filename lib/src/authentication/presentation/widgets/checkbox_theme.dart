import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utils/constants/colors.dart';
import 'package:e_commerce_app/core/utils/constants/sizes.dart';

/// Custom Class for Light & Dark Text Themes
class EcomCheckboxTheme {
  EcomCheckboxTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(EcomSizes.xs)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return EcomColors.white;
      } else {
        return EcomColors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return EcomColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /// Customizable Dark Text Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(EcomSizes.xs)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return EcomColors.white;
      } else {
        return EcomColors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return EcomColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
