import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:products/core/theme/consts/p_colors.dart';

class AppConfigUI {
  AppConfigUI._();

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: PColors.white,
    textTheme: TextTheme(bodyMedium: GoogleFonts.poppins(fontSize: 15)),
    //brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0.0,
      actionsIconTheme: IconThemeData(
        color: PColors.black,
      ),
      iconTheme: IconThemeData(
        color: PColors.black,
      ),
      backgroundColor: PColors.white,
    ),
    iconTheme: const IconThemeData(color: PColors.white),
    primaryIconTheme: const IconThemeData(color: PColors.white),
    fontFamily: 'Poppins',

    colorSchemeSeed: PColors.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: OutlinedButton.styleFrom(
          textStyle: GoogleFonts.poppins(
              letterSpacing: 0.35,
              fontSize: 16,
              color: PColors.neutralColor,
              fontWeight: FontWeight.w600),
          backgroundColor: PColors.secondColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: PColors.white,
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          textStyle: GoogleFonts.poppins(
              letterSpacing: 0.35,
              fontSize: 16,
              color: PColors.black,
              fontWeight: FontWeight.w600),
          backgroundColor: PColors.secondColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    ),

    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: PColors.black, selectionColor: PColors.black),
    inputDecorationTheme: InputDecorationTheme(
      prefixStyle: GoogleFonts.poppins(color: PColors.black, fontSize: 15),
      hintStyle: GoogleFonts.poppins(color: PColors.black, fontSize: 15),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: PColors.secondColor),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: PColors.primaryColor),
      ),
      labelStyle: const TextStyle(color: PColors.black),
    ),
  );
}
