import 'package:flutter/material.dart';
import 'package:shopapp/componants/colors.dart';

const defaultPadding = 20.0;
const cartBarHeight = 100.0;
const headerHeight = 200.0;

const bgColor = Color(0xFFF6F5F2);
const primaryColor = Color(0xFF40A944);

const panelTransition = Duration(milliseconds: 500);
late Widget startWidget;

var themData = ThemeData(
  scaffoldBackgroundColor: colorHome,
  primaryColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: colorItem,
    elevation: 0,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    actionsIconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontFamily: 'Good Fonts',
    ),
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
    fontSize: 12.5,
    color: Colors.black,
  )),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
);
var darktheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    elevation: 0,
    actionsIconTheme: IconThemeData(),
    titleTextStyle:
        TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'Good Fonts'),
  ),
  scaffoldBackgroundColor: Colors.black,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.deepPurple, unselectedItemColor: Colors.black),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 12.5,
      color: Colors.white,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
