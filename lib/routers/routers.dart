import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String userInfo = '/user-info';

  static void configureRoutes(Router router) {
    router.define(home, handler: homeHandler);
    router.define(userInfo, handler: userInfoHandler);
    router.define('/error', handler: widgetNotFoundHandler);
  }
}
