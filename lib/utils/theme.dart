//Colors for theme
//  Color(0xfffcfcff);
import 'package:flutter/material.dart';

Color lightPrimary = Color(0xfffcfcff);
Color accent= Color(0xff8F3B76);
Color purple=  const Color(0xff432B7B);
Color lightPurple= Color(0xff6A4BBC);
Color yellow = Color(0xffFFC175);
 Color brown = Color(0xff3E0606);

Color textColor = const Color(0xff828282);

 const Color offWhite = const Color(0xfff2f2f2);
Color black = Color(0xff000000);


final TextStyle textStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w500,
    color: offWhite);

ThemeData appTheme = ThemeData(
  backgroundColor: lightPrimary,
  primaryColor: lightPrimary,
  accentColor:  Colors.yellow,
  cursorColor: yellow,
  fontFamily: 'BasisGrotesquePro',
  scaffoldBackgroundColor: lightPrimary,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      headline6: TextStyle(
        color: textColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    ),

  ),
);