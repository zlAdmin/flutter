import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String userInfo = '/user-info';
  static String appearaMaster = '/appeara-master';
  static String moviesList = '/movies-list';
  static String onlineMall = '/online-mall';
  static String foodList = '/food-list';

  static void configureRoutes(Router router) {
    router.define(home, handler: homeHandler);
    router.define(userInfo, handler: userInfoHandler);
    router.define(appearaMaster, handler: appearaMasterHandler);
    router.define(moviesList, handler: moviesListHandler);
    router.define(onlineMall, handler: onLineMallHandler);
    router.define(foodList, handler: foodListHandler);
    router.define('/error', handler: widgetNotFoundHandler);
  }
}
