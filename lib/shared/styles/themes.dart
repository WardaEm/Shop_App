import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor:HexColor('#2C3E50'),
  primarySwatch: defaultColor,

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('#2C3E50'),
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,

  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white
      )
  ),
  appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),
      backgroundColor: HexColor('#2C3E50'),
      elevation: 0.0,
      iconTheme: IconThemeData(
          color: Colors.white
      ),

      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('#2C3E50'),
          statusBarIconBrightness: Brightness.light
      )
  ),
);
ThemeData lightTheme=ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: defaultColor,
elevation: 20,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
  ),
  appBarTheme: AppBarTheme(
      titleSpacing:20 ,
      titleTextStyle: TextStyle(
           color: Colors.orange,
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
       iconTheme: IconThemeData(
          color: defaultColor
       ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      )
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black
      )
  ),

);
