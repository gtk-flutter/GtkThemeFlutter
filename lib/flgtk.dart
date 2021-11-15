// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flgtk/gtk_button_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GtkThemeData {
  static const MethodChannel _channel = MethodChannel('flgtk');

  String name;
  int theme_fg_color;
  int theme_text_color;
  int theme_bg_color;
  int theme_base_color;
  int theme_selected_bg_color;
  int theme_selected_fg_color;

  int warning_color;
  int error_color;
  int success_color;

  GtkButtonThemeData buttonThemeData;

  String font;

  GtkThemeData({
    required this.name,
    this.theme_fg_color = 0xff,
    this.theme_text_color = 0xff,
    this.theme_bg_color = 0xff,
    this.theme_base_color = 0xff,
    this.theme_selected_bg_color = 0xff,
    this.theme_selected_fg_color = 0xff,
    this.warning_color = 0xff,
    this.error_color = 0xff,
    this.success_color = 0xff,
    this.font = "",
    this.buttonThemeData = GtkButtonThemeData.empty,
  });

  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: Color(theme_base_color),
      );

  static Future<Map<Object?, Object?>> _getRawData() async {
    return await _channel.invokeMethod('getThemeData');
  }

  static Future<GtkThemeData> initialize() async {
    var data = await _getRawData();
    debugPrint(data.toString());

    return GtkThemeData(
      name: data["name"] as String,
      theme_fg_color: data["theme_fg_color"] as int,
      theme_text_color: data["theme_text_color"] as int,
      theme_bg_color: data["theme_bg_color"] as int,
      theme_base_color: data["theme_base_color"] as int,
      theme_selected_bg_color: data["theme_selected_bg_color"] as int,
      theme_selected_fg_color: data["theme_selected_fg_color"] as int,
      warning_color: data["warning_color"] as int,
      error_color: data["error_color"] as int,
      success_color: data["success_color"] as int,
      font: data["font"] as String,
      buttonThemeData: GtkButtonThemeData(
        normal_bg: (data["button"]! as Map)["normal_bg"],
        normal_fg: (data["button"]! as Map)["normal_fg"],
        active_bg: (data["button"]! as Map)["active_bg"],
        active_fg: (data["button"]! as Map)["active_fg"],
        prelight_bg: (data["button"]! as Map)["prelight_bg"],
        prelight_fg: (data["button"]! as Map)["prelight_fg"],
        selected_bg: (data["button"]! as Map)["selected_bg"],
        selected_fg: (data["button"]! as Map)["selected_fg"],
        focused_bg: (data["button"]! as Map)["focused_bg"],
        focused_fg: (data["button"]! as Map)["focused_fg"],
        checked_bg: (data["button"]! as Map)["checked_bg"],
        checked_fg: (data["button"]! as Map)["checked_fg"],
      ),
    );
  }
}
