import 'package:flutter/material.dart';

class UserMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("user"),
          centerTitle: true,
        ),
        body: redenerBody());
  }
}

Widget redenerBody() {
  return Center(
      child: Container(
    child: Card(
      color: Colors.orange,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: ClipOval(
              child: Image.asset(
                'images/a.jpg',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              '张三',
              style: TextStyle(fontSize: 28),
            ),
            subtitle: Text('高级工程师'),
          ),
          ListTile(
            title: Text('电话：'),
            subtitle: Text("13126521905"),
          ),
          ListTile(
            title: Text('地址：'),
            subtitle: Text("武汉市洪山区光谷广场"),
          )
        ],
      ),
    ),
  ));
}
