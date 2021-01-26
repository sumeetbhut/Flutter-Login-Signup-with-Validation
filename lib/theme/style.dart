import 'package:flutter/material.dart';
import 'package:login_signup_ui_flutter_app/utils/color-utils.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: ColorUtils.appColor,
    accentColor: ColorUtils.appColor,
    hintColor: Colors.grey,
    dividerColor: Colors.black,
    buttonColor: ColorUtils.appColor,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
  );
}

Color backgroundColor = Color(0xffeef2f5);

TextStyle chatNameStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold
);

TextStyle headerNameStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold
);

TextStyle smallNameStyle = TextStyle(
    fontSize: 12,
);

TextStyle articleNameStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold
);

TextStyle articleContentStyle = TextStyle(
    fontSize: 14,
);

TextStyle articleIndexStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold
);

TextStyle chatEmailStyle = TextStyle(
    fontSize: 14,
);
BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey[200],
        blurRadius: 4,
        spreadRadius: 4,
      ),
    ],
    borderRadius: BorderRadius.circular(12)
);

BoxShadow boxShadow = BoxShadow(
  color: Colors.grey[200],
  blurRadius: 4,
  spreadRadius: 4,
);
