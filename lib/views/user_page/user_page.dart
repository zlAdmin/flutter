import 'package:flutter/material.dart';
import 'package:flutter_app_zfy/model/user_info.dart';

class UserPage extends StatefulWidget {
  final UserInfo userInfo;

  UserPage({Key key, this.userInfo}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();

}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('user-info')
      ),
    );
  }
}