import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:weather/views/homeIndex.dart';

// 首页
var homeIndexHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params){
  return new HomeIndex();
});
