import 'package:flutter/material.dart';

class UserMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("user"),
          centerTitle: true,
        ),
        body: Container(child: Text("用户详情")));
  }
}