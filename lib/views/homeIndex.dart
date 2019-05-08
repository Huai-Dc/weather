import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/utils/screenUtil.dart';

/**
 * created by Huai 2019/5/8 0008
 */
class HomeIndex extends StatefulWidget {
  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {
  var _first = 0;// 安卓再按一次退出

  Future<bool> _requestPop() {
    if (_first != 0 &&
        new DateTime.now().millisecondsSinceEpoch - _first < 2000) {
      return new Future<bool>.value(true);
    } else {
      _first = new DateTime.now().millisecondsSinceEpoch;
      print("再按一次退出");
//      Fluttertoast.showToast(
//        msg: "再按一次退出应用",
//        toastLength: Toast.LENGTH_SHORT,
//        timeInSecForIos: 1,
//        gravity: ToastGravity.BOTTOM,
//      );
      new Timer(new Duration(milliseconds: 2000), () {
        _first = 0;
      });
      return new Future<bool>.value(false);
    }
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(designW: 750, designH: 1334)..init(context);
    return new WillPopScope(
      onWillPop: _requestPop,
      child: new Scaffold(
        backgroundColor: Colors.white,
        body: new Container(
          child: Center(
            child: Text("首页"),
          ),
        ),
      ),
    );
  }
}
