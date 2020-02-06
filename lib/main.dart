
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'routers/routers.dart';
import 'routers/application.dart' show Application;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_app_zfy/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    // 这里设置项目环境
    Application.router = router;
  }

 @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    print('初始操作，比如初始化jpush');
    setState(() {
      _isLoading = true; 
    });

    Future.delayed(Duration(seconds: 3), (){
        setState(() {
          _isLoading = false;
        });
      });
      
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Scaffold(body: showWelcomePage()),
      onGenerateRoute: Application.router.generator,
    );
  }

  showWelcomePage() {
    if (_isLoading) {
      return Container(
        color: Color(0xFFC91B3A),
        child: Center(
          child: SpinKitPouringHourglass(color: Colors.white),
        ),
      );
    } else {
      return AppPage(title: '张发勇');
    }
  }
}
