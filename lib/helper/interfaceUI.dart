import 'dart:ui';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cisemoa/helper/style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'transition.dart';

class WidgetT extends StatelessWidget {
  static void openPageWithFade(BuildContext context, dynamic page, { int? time, bool? first=false}) {
    if(first!)
      Navigator.of(context).popUntil((route) => route.isFirst);

    //Navigator.push(context, MaterialPageRoute(builder: (context) => page),);
    Navigator.of(context).push(FadePageRoute(page, time ?? 0));
  }
  static Widget iconNormal(IconData icon, { double? size, Color? color }) {
    return SizedBox(
      height: size ?? 30, width: size ?? 30,
      child: Icon(
        icon, size: 20, color: color ?? StyleT.titleColor.withOpacity(0.7),
      ),
    );
  }
  static Widget iconBig(IconData icon, { double? size, Color? color }) {
    return SizedBox(
      height: size ?? 30, width: size ?? 30,
      child: Icon(
        icon, size: 28, color: color ?? StyleT.titleColor.withOpacity(0.7),
      ),
    );
  }
  static Widget iconLager(IconData icon, { double? size, Color? color }) {
    return SizedBox(
      height: size ?? 30, width: size ?? 30,
      child: Icon(
        icon, size: 36, color: color ?? StyleT.titleColor.withOpacity(0.7),
      ),
    );
  }

  static Widget titleBig(String text, { double? size }) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: size ?? 18,
            fontFamily: '',
            fontWeight: FontWeight.w900,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = StyleT.titleColor.withOpacity(0.6),
          ),
        ),
        Text(text, style: TextStyle(fontFamily: '',
            fontWeight: FontWeight.w900,
            fontSize: size ?? 18, color: StyleT.titleColor.withOpacity(0.6))),
      ],
    );
  }
  static Widget titleNormal(String text) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontFamily: '',
            fontWeight: FontWeight.w900,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = StyleT.titleColor.withOpacity(0.5),
          ),
        ),
        Text(text, style: TextStyle(fontFamily: '',
            fontWeight: FontWeight.w900,
            fontSize: 14, color: StyleT.titleColor.withOpacity(0.5))),
      ],
    );
  }
  static Widget textBig(String text) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontFamily: '',
            fontWeight: FontWeight.w900,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = StyleT.textColor.withOpacity(0.7),
          ),
        ),
        Text(text, style: TextStyle(fontFamily: '',
            fontWeight: FontWeight.w900,
            fontSize: 14, color: StyleT.textColor.withOpacity(0.7))),
      ],
    );
  }

  Widget build(context) {
    return Container();
  }
}
