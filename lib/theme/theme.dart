import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor:
    const Color(0xFFD7EEF3), //drawer header bg and scaffold
    // for buttons (most used color in our app is primary color)
    cardColor: const Color(0xFF187B9D),
    colorScheme: const ColorScheme.light(
        primary: Color(0xFF187B9D), //all buttons bg
        secondary: Color(0xFF1B7A98), // body text color
        tertiary: Color(0xFF2EF2F5), //headline aaroha color
        surface: Color(0xFF53B4C7), // login bg
        surfaceDim: Color(0xFF53B5C6) // splash screen bg
    ),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 48,
            color: Color(0xFF2EF2F5),
            fontWeight: FontWeight.bold
        ),
        titleLarge: TextStyle(
            fontSize: 48,
            color: Color(0xFF187B9D),
            fontWeight: FontWeight.bold
        )

    )
);

// class TextThemeData {
//   final headingFontSize = 55; //home page AAROHA
//   final bodyFontSizeSmall = 12; //body text
//   final bodyFontSizeMedium = 15; //body text
//   final bodyTextColor = const Color(0xFF1B7A98);
//   final headingTextColor = const Color(0xFF2EF2F5);
//   final titleFontSize = 48;
// }