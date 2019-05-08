import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:weather/router/router_handler.dart';

class Routes {
  static String root = "/"; // 首页  不可换其他路径

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    // 注册页面  参数传递请写在 router_handler.dart 文件中
    router.define(root, handler: homeIndexHandler); // homeIndexHandler
  }
}
