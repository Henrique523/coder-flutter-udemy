import 'package:flutter/material.dart';

var themeData = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.amber,
  fontFamily: 'OpenSans',
  textTheme: ThemeData.light().textTheme.copyWith(
    headline6: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    button: TextStyle(
      color: Colors.white,
    )
  ),
  appBarTheme: AppBarTheme(
    textTheme: ThemeData.light().textTheme.copyWith(
      headline6: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )
    ),
  )
);
