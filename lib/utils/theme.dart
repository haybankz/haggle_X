//Colors for theme
//  Color(0xfffcfcff);
import 'package:flutter/material.dart';

Color lightPrimary = Color(0xfffcfcff);
Color purple= Color(0xff8F3B76);
Color orange = Color(0xffFFA500);
//  static Color darkAccent = Color(0xff0A472C);
//  static Color darkAccent = Color(0xff05400A);
//  static Color lightBG = Color(0xfffcfcff);
//  static Color darkBG = Colors.black;
Color textColor = const Color(0xff828282);
const Color darkTextColor = const Color(0xff333333);
//  static Color yellow = Color(0xffF49D0E);
//  static Color ratingBG = Colors.yellow[600];
 const Color offWhite = const Color(0xfff2f2f2);
Color grey = Color(0xffD5DDE0);
Color black = Color(0xff0f0f00);

// String naira = '\u{20A6}';

ThemeData lightTheme = ThemeData(
  backgroundColor: lightPrimary,
  primaryColor: lightPrimary,
  accentColor:  purple,
  cursorColor: orange,
  fontFamily: 'raleway',
  scaffoldBackgroundColor: lightPrimary,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(

      headline6: TextStyle(
        color: textColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
  ),
);