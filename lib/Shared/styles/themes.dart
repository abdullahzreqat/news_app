import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
      bodySmall: TextStyle(color: Colors.grey,fontSize: 13),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 18)),
  primarySwatch: Colors.teal,
  bottomNavigationBarTheme:
  BottomNavigationBarThemeData(selectedItemColor: Colors.teal),
  appBarTheme: AppBarTheme(
      elevation: 2,
      titleSpacing: 20,
      titleTextStyle: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      color: Colors.white,
      foregroundColor: Colors.teal,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white60,
          statusBarIconBrightness: Brightness.dark)),
  scaffoldBackgroundColor: Colors.white,
);
ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
      bodySmall: TextStyle(color: Colors.white60,fontSize: 13,),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18)),
  primarySwatch: Colors.teal,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.teal, backgroundColor: Colors.black),
  unselectedWidgetColor: Colors.grey,
  appBarTheme: AppBarTheme(
      elevation: 2,
      titleSpacing: 20,
      titleTextStyle: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      color: Colors.black,
      foregroundColor: Colors.teal,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light)),
  scaffoldBackgroundColor: Colors.black,
);