import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_zfy/model/user_info.dart';
import 'package:flutter_app_zfy/views/user_page/user_page.dart';
import '../widgets/404.dart';
import 'package:flutter_app_zfy/views/home.dart';
import 'package:flutter_app_zfy/views/appearance_master/appearance_master.dart';


// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return AppPage();
  },
);

var userInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new UserPage(userInfo: new UserInfo());
});

// 404 页面
var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WidgetNotFound();
});

// 颜值大师页面
var appearaMasterHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new AppearanceMaster();
});
