import 'package:flutter/material.dart';

class UtilsScreen {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color highlightColor;
  final Color foregroundColor;
  final AssetImage logo;

  UtilsScreen(
      {this.backgroundColor1,
      this.backgroundColor2,
      this.highlightColor,
      this.foregroundColor,
      this.logo});

  static UtilsScreen _instance;

  static UtilsScreen getInstance(
      {Color backgroundColor1,
      Color backgroundColor2,
      Color highlightColor,
      Color foregroundColor,
      AssetImage logo}) {
    if (_instance == null) {
      _instance = UtilsScreen(
        backgroundColor1: backgroundColor1,
        backgroundColor2: backgroundColor2,
        highlightColor: highlightColor,
        foregroundColor: foregroundColor,
        logo: logo,
      );
    }

    return _instance;
  }
}
