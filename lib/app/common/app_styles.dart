import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData appStyle = ThemeData(
  // primarySwatch: Colors.grey,
  primaryColor: Colors.grey,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'AppleSDGothicNeo',
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    elevation: 0,
  ),
);
