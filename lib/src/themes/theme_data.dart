import 'package:flutter/material.dart';
import 'package:upstock/src/common/constants/constants.dart';
import 'package:upstock/src/themes/theme_widgets_constant.dart';

import 'theme_constant.dart';

class Themes {
  Themes._(); // private constructor

  /// Light Theme
  static final ThemeData light = ThemeData.light().copyWith(
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          background: kSecondaryColor,
          brightness: Brightness.light,
        ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: lightTextTheme,
    scaffoldBackgroundColor: kScafoldColor,
    primaryIconTheme: const IconThemeData(color: kBlackColor),
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonThemeData,
    inputDecorationTheme: inputDecorationTheme,
  );

  /// Dark Theme
  static final ThemeData dark = ThemeData.dark().copyWith(
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: kPrimaryColorDark,
          secondary: kSecondaryColor,
          background: kPrimaryColorDark,
          brightness: Brightness.dark,
        ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: darkTextTheme,
    scaffoldBackgroundColor: kBlackColor,
    primaryIconTheme: const IconThemeData(color: kWhiteColor),
    elevatedButtonTheme: elevatedButtonThemeData,
  );
}
