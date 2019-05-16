/**
 * created by Huai 2019/5/16 0016
 */
import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  final Color color;

  DividerLine({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 0.2,
        color: color ?? Colors.white,
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0));
  }
}