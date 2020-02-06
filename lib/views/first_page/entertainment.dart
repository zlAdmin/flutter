import 'package:flutter/material.dart';
import 'package:flutter_app_zfy/routers/application.dart' show Application;
import 'package:flutter_app_zfy/routers/routers.dart' show Routes;
import 'package:fluro/fluro.dart';

// 娱乐频道
class Entertainment extends StatefulWidget {

  @override
  _Entertainment createState() => _Entertainment();

}

class _Entertainment extends State<Entertainment> {
  List<Widget> list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('娱乐频道'),
        centerTitle: true,
      ),
      body: renderBody()
    );
  }

  renderBody() {
   setState(() {
      list.add(enterainMentMenu('颜值大师', Icons.face, Routes.appearaMaster));
      list.add(enterainMentMenu('敬请期待', Icons.more, ''));
   });
    return new Center(
        child: new ListView(
          children: list,
        ),
      );
  }

  Widget enterainMentMenu(String title, IconData icons, String router) {
    return new ListTile(
                    leading: Icon(
                      icons,
                      size: 30.0,
                      color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17.0),
                        ),
                        trailing:
                            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
                        onTap:  () {
                          Application.router.navigateTo(
                                context, router,
                                transition: TransitionType.native);
                        },
                  );
  }
}