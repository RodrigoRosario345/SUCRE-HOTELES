// ignore_for_file: prefer_interpolation_to_compose_strings, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static String? primaryColorString = "#EE0000";
  static String? secondaryColorString = "#FFFFFF";
  static String? complementaryColorString = "#1AB65C";

  static bool isLightTheme = true;

  static ThemeData getTheme() {
    if (isLightTheme) {
      return lightTheme();
    } else {
      return darkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline6: GoogleFonts.sourceSansPro(
        color: base.headline6!.color,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: GoogleFonts.sourceSansPro(
        color: base.subtitle1!.color,
        fontSize: 20,
      ),
      subtitle2: GoogleFonts.sourceSansPro(
        color: base.subtitle2!.color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: GoogleFonts.sourceSansPro(
        color: base.bodyText2!.color,
        fontSize: 10,
      ),
      bodyText1: GoogleFonts.sourceSansPro(
        color: base.bodyText1!.color,
        fontSize: 10,
      ),
      button: GoogleFonts.sourceSansPro(
        color: base.button!.color,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      caption: GoogleFonts.sourceSansPro(
        color: base.caption!.color,
        fontSize: 10,
      ),
      headline4: GoogleFonts.sourceSansPro(
        color: base.headline4!.color,
        fontSize: 10,
      ),
      headline3: GoogleFonts.sourceSansPro(
        color: base.headline3!.color,
        fontSize: 10,
      ),
      headline2: GoogleFonts.sourceSansPro(
        color: base.headline2!.color,
        fontSize: 10,
      ),
      headline1: GoogleFonts.sourceSansPro(
        color: base.headline1!.color,
        fontSize: 10,
      ),
      headline5: GoogleFonts.sourceSansPro(
        color: base.headline5!.color,
        fontSize: 10,
      ),
      overline: GoogleFonts.sourceSansPro(
        color: base.overline!.color,
        fontSize: 10,
      ),
    );
  }

  static ThemeData lightTheme() {
    Color primaryColor = HexColor(primaryColorString!);
    Color secondaryColor = HexColor(secondaryColorString!);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );

    final ThemeData base = ThemeData.light();
    return base.copyWith(
      appBarTheme: const AppBarTheme(color: Colors.white),
      popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      splashColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      errorColor: Colors.red,
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      indicatorColor: primaryColor,
      disabledColor: HexColor("#D5D7D8"),
      dividerColor: Colors.black.withOpacity(0.8),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    );
  }

  static ThemeData darkTheme() {
    Color primaryColor = HexColor(primaryColorString!);
    Color secondaryColor = HexColor(secondaryColorString!);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      popupMenuTheme: const PopupMenuThemeData(color: Colors.black),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      platform: TargetPlatform.iOS,
      dividerColor: Colors.white.withOpacity(0.8),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0.5)),
      dialogBackgroundColor: Colors.black,
      dialogTheme: DialogTheme(
          titleTextStyle: GoogleFonts.sourceSansPro(
            color: Colors.white,
            fontSize: 10,
          ),
          contentTextStyle: GoogleFonts.sourceSansPro(
            color: Colors.white,
            fontSize: 10,
          ),
          backgroundColor: Colors.black),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "EE" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
