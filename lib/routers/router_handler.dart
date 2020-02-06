import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_zfy/model/user_info.dart';
import 'package:flutter_app_zfy/views/user_page/user_page.dart';
import '../widgets/404.dart';


// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return null;
  },
);

var userInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new UserPage(userInfo: new UserInfo());
});

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WidgetNotFound();
});

