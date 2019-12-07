import 'package:flutter/material.dart';

class Themes {
  Themes();
  static ThemeData formTheme = ThemeData.light().copyWith(
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    errorColor: Colors.red[100],
    cardColor: Colors.white,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.indigo,
<<<<<<< HEAD
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0,
    ),
=======
>>>>>>> 77a4dd199acf9594bd9ece7bde21e0ce8f3155f7
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.grey[800],
        fontSize: 14,
      ),
      body1: TextStyle(color: Colors.white70),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    hintColor: Color(0x80FFFFFF),
    disabledColor: Color(0x80FFFFFF),
    accentColor: Colors.greenAccent,
    dividerColor: Colors.white30,
    toggleableActiveColor: Colors.greenAccent,
    unselectedWidgetColor: Colors.white,
  );
}
