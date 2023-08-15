import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.grey,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[800]!,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle:
        GoogleFonts.sourceSansPro(color: Colors.white, fontSize: 19),
  ),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey[900]!,
    primary: Colors.grey[800]!,
    secondary: Colors.grey[700]!,
    tertiary: Colors.white,
  ),
);
