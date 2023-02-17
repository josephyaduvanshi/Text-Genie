import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';

class TextGenieTheme {
  static ThemeData light() {
    ThemeData theme = ThemeData.light().copyWith(
      useMaterial3: true,
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xff00b0ff),
        onPrimary: Colors.white,
        secondary: const Color(0xff00b0ff),
        onSecondary: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black,
        background: Colors.blueGrey[50],
        onBackground: Colors.black,
      ),
      visualDensity: VisualDensity.compact,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 12.0,
        ),
        bodyMedium: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 13.0,
        ),
        bodySmall: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(
          fontSize: 14.0,
        ),
      ),
      splashColor: Colors.transparent,
    );

    Color accentColor = SystemTheme.accentColor.light;

    return theme.copyWith(
      primaryColor: accentColor,
      popupMenuTheme: PopupMenuThemeData(
        textStyle: theme.textTheme.bodyLarge,
        color: Colors.grey.shade100,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: Colors.black12, width: 1.0),
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.grey[700],
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    );
  }

  static ThemeData dark() {
    ThemeData theme = ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: const Color(0xff00b0ff),
        onPrimary: Colors.black,
        secondary: const Color(0xff00b0ff),
        onSecondary: Colors.white,
        surface: Colors.grey[900],
        onSurface: Colors.white,
        background: const Color(0xff2c2c2c),
        onBackground: Colors.white,
      ),
      visualDensity: VisualDensity.compact,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 12.0,
        ),
        bodyMedium: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 13.0,
        ),
        bodySmall: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(
          fontSize: 14.0,
        ),
      ),
      splashColor: Colors.transparent,
    );
    Color accentColor = SystemTheme.accentColor.dark;

    return theme.copyWith(
      primaryColor: accentColor,
      popupMenuTheme: PopupMenuThemeData(
        textStyle: theme.textTheme.bodyLarge,
        color: Colors.grey[800],
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.grey[900],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: Colors.black12, width: 1.0),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    );
  }
}
