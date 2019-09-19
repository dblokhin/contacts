// Copyright 2019 The Privacy App Developers. All rights reserved.
// Use of this source code is governed by a MIT LICENSE
// Also read license file that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class ThemeModel {
  Color get primaryColor => Colors.blue;
  Color get primaryColorLight => Colors.blue[50];
  Color get primaryColorMiddleLight => Colors.blue[300];
  Color get primaryColorDark => Colors.blue[700];

  Color get secondaryColor => Colors.green;

  ThemeData get theme => ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          primaryVariant: primaryColorDark,
        ),
      ).copyWith(
        accentColor: Colors.red,
      );
  /*primaryColor: Colors.orange,
        primaryColorLight: Colors.orange[50],
        primaryColorDark: primaryColorDark,
        accentColor: accentColor,
        iconTheme: IconThemeData(color: primaryColorDark),
        chipTheme: ChipThemeData.fromDefaults(
          primaryColor: accentColor,
          secondaryColor: accentColor,
          labelStyle: TextStyle(fontSize: 12),
        ),
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: primaryColorDark,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        toggleButtonsTheme: ToggleButtonsThemeData(
          color: Colors.black87,
          selectedColor: Colors.black,
          borderColor: primaryColorMiddleLight,
          selectedBorderColor: primaryColorMiddleLight,
          fillColor: Colors.orange[100],
          borderRadius: BorderRadius.circular(8),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: primaryColorLight,
          ),
          textTheme: TextTheme().copyWith(
            title: TextStyle(
              fontSize: 20,
              color: primaryColorLight,
            ),
          ),
        ),
        primaryTextTheme: TextTheme().copyWith(
          title: TextStyle(
            fontSize: 20,
            color: primaryColorLight,
          ),
        ),*/

  ThemeData get darkTheme => ThemeData.from(colorScheme: ColorScheme.dark());
}
