/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:cisemoa/LoginPage.dart';
import 'package:cisemoa/main.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return MyHomePage();
    });

var loginRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      String? message = params["message"]?.first;
      String? colorHex = params["color_hex"]?.first;
      String? result = params["result"]?.first;
      Color color = Color(0xFFFFFFFF);
      return LoginPage();
    });
/*

/// Handles deep links into the app
/// To test on Android:
///
/// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
var deepLinkHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      String? colorHex = params["color_hex"]?.first;
      String? result = params["result"]?.first;
      Color color = Color(0xFFFFFFFF);
      if (colorHex != null && colorHex.length > 0) {
        color = Color(ColorHelpers.fromHexString(colorHex));
      }
      return DemoSimpleComponent(
          message: "DEEEEEP LINK!!!", color: color, result: result);
    });*/
