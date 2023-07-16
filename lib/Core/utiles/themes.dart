import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constance.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: kPrimarylight,
    scaffoldBackgroundColor: kbackgroundlightColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: kbackgroundlightColor,
      elevation: 0.2,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: kbackgroundlightColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 20.0,
      backgroundColor: kbackgroundlightColor,
      selectedItemColor: kPrimarylight,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.black,
      hintStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 3, color: Colors.black),
      ),
    ),
    iconTheme: const IconThemeData(
      color: kPrimarylight,
    ),
    hintColor: Colors.black,
    buttonTheme: const ButtonThemeData(
      buttonColor: kPrimarylight,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.accent,
    ));

ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: kbackgroundDarkColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kbackgroundDarkColor,
      elevation: 0.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: kbackgroundDarkColor,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      toolbarTextStyle: GoogleFonts.montserratTextTheme().bodyMedium,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 20.0,
      backgroundColor: Color.fromARGB(31, 95, 81, 81),
      selectedItemColor: kPrimaryDark,
      unselectedItemColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 3, color: Colors.white),
        //  borderRadius: BorderRadius.circular(),
      ),
    ),
    iconTheme: const IconThemeData(
      color: kPrimaryDark,
    ),
    hintColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      buttonColor: kPrimaryDark,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.accent,
    ));
