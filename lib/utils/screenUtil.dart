/*
 * created by Huai 2019/5/5 0005
 * 修改自 https://github.com/OpenFlutter/flutter_screenutil
 */
import 'package:flutter/material.dart';

class ScreenUtil {
  static ScreenUtil instance = new ScreenUtil();
  // 设计稿初始值
  double designW;
  double designH;

  static double _deviceWidth;     // 屏幕宽度
  static double _deviceHeight;    // 屏幕宽度
  static double _pixelRatio;      // 像素密度
  static double _statusBarHeight; // 状态栏高度
  static double _bottomBarHeight; // 底部安全区距离
  static double _textScaleFactor; // 字体缩放
  static Orientation _orientation;// 屏幕方向

  ScreenUtil({
    this.designW = 750.0,
    this.designH = 1334.0,
  });

  // 实例
  static ScreenUtil getInstance() {
    return instance;
  }

  // 初始化
  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _pixelRatio = mediaQuery.devicePixelRatio;
    _deviceWidth = mediaQuery.size.width;
    _deviceHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = mediaQuery.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
    _orientation = mediaQuery.orientation;
  }

  /// 当前设备宽度
  double get deviceWidth => _deviceWidth;
  /// 当前设备高度
  double get deviceHeight => _deviceHeight;
  /// 状态栏高度
  double get stateBarHeight => _statusBarHeight;
  /// 底部状态栏高度
  double get bottomBarHeight => _bottomBarHeight;
  /// 像素密度
  double get pixelRatio => _pixelRatio;
  /// 设备方向
  Orientation get orientation => _orientation;

  /// 实际的dp与设计稿px的比例
  getWidth(double size) => size * _deviceWidth / instance.designW;

  getHeight(double size) => size * _deviceHeight / instance.designH;
  /// 返回根据屏幕宽适配后字体尺寸
  getScaleSp(double fontSize) => fontSize * _deviceWidth / instance.designW;
}