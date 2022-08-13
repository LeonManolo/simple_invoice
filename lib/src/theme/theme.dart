import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      textTheme: GoogleFonts.novaCutTextTheme(),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: theme.textTheme.headline6?.copyWith(color: Colors.black)),
        primaryColorLight: Colors.deepPurple,
        primaryColor: Colors.deepPurple);
  }
}
