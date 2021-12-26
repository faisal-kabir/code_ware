import 'dart:ui';

import 'package:flutter/material.dart';

class Themes{
  static Color Primary= const Color(0xFF2B2457);
  static Color Primary2= const Color(0xFFF7941C);
  static Color Primary_Lite= const Color(0xFFFFFFFF);
  static Color Primary_Dark=Color(int.parse('#2661FA'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Primary_Accent=Color(int.parse('#002b83'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Background= const Color(0xFFFDFDFD);

  static Color Icon_Color=Color(int.parse('#ffffff'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Highlite_Text_Color=Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Text_Color= const Color(0xFF404040);
  static Color TextField_Error_Color=Color(int.parse('#FCDDDD'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color Button_Color1=Color(int.parse('#FC8E22'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Button_Color2=Color(int.parse('#FDA526'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color DropDown=Color(int.parse('#EAECEF'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Curve_Color=Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color White=Colors.white;
  static Color Grey= const Color(0xFF707070);
  static Color Grey_Lite= const Color(0xFFEFEFEF);
  static Color Rating_Color= const Color(0xFFFFD54F);

  static Color Green= const Color(0xFF6FB900);
  static Color Green_lite= const Color(0xFFA6CC2B);
  static Color Green_Dark= const Color(0xFF009247);
  static Color Yellow= const Color(0xFFFFAA00);
  static Color Red= const Color(0xFFC1272D);
  static Color Red_lite= const Color(0xFFFF0000);

  static Color TextFieldBorder= const Color(0xFF434343);
  static Color TextFieldBackground= const Color(0xFFF5F5F5);
  static Color Border= const Color(0xFF707070);

  static Color Blue= const Color(0xff1473E6);

  static getColorFromColorCode(String code){
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}