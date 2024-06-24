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
      // headlineLarge: GoogleFonts.sourceSansPro(
      //   color: base.headlineLarge!.color,
      //   fontSize: 10,
      //   fontWeight: FontWeight.w500,
      // ),
      titleMedium: GoogleFonts.lato(
        color: base.titleMedium!.color,
        fontSize: 20,
      ),
      titleSmall: GoogleFonts.lato(
        color: base.titleSmall!.color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.lato(
        color: base.bodyMedium!.color,
        fontSize: 10,
      ),
      bodyLarge: GoogleFonts.lato(
        color: base.bodyLarge!.color,
        fontSize: 10,
      ),
      labelLarge: GoogleFonts.lato(
        color: base.labelLarge!.color,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.lato(
        color: base.bodySmall!.color,
        fontSize: 10,
      ),
      headlineMedium: GoogleFonts.lato(
        color: base.headlineMedium!.color,
        fontSize: 10,
      ),
      headlineLarge: GoogleFonts.lato(
        color: base.headlineLarge!.color,
        fontSize: 10,
      ),
      displaySmall: GoogleFonts.lato(
        color: base.displaySmall!.color,
        fontSize: 10,
      ),
      displayLarge: GoogleFonts.lato(
        color: base.displayLarge!.color,
        fontSize: 10,
      ),
      // headlineMedium: GoogleFonts.sourceSansPro(
      //   color: base.headlineMedium!.color,
      //   fontSize: 10,
      // ),
      labelSmall: GoogleFonts.lato(
        color: base.labelSmall!.color,
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
      background: Colors.white,
      error: Colors.red,
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
      background: Colors.black, // Mueve background aquí
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
      scaffoldBackgroundColor: Colors.black,
      // labelLargeTheme: labelLargeThemeData(
      //   colorScheme: colorScheme,
      //   textTheme: labelLargeTextTheme.primary,
      // ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      platform: TargetPlatform.iOS,
      dividerColor: Colors.white.withOpacity(0.8),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0.5)),
      dialogBackgroundColor: Colors.black,
      dialogTheme: DialogTheme(
          titleTextStyle: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 10,
          ),
          contentTextStyle: GoogleFonts.lato(
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
