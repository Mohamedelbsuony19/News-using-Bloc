import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class myTheme {
  static final ThemeData light = ThemeData(
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleSpacing: 20,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      elevation: 20,
      //  backgroundColor:  HexColor('333739')
    ),
    textTheme: TextTheme(
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
            // use on date font
            color: Colors.black,
            fontSize: 17)),
  );

  static final ThemeData dark = ThemeData(
      scaffoldBackgroundColor: HexColor('333739'),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
      appBarTheme: AppBarTheme(
        backgroundColor: HexColor('333739'),
        titleSpacing: 20,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          elevation: 20,
          backgroundColor: HexColor('333739')),
      textTheme: TextTheme(
        titleMedium: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        bodySmall: TextStyle(
            // use on date font
            color: Colors.white,
            fontSize: 17),
      ));
}
