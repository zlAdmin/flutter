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
      body: Center(
        child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(150),
          // 圆形图片
          image: DecorationImage(
            image: NetworkImage('https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1067487824,1623759373&fm=26&gp=0.jpg'),
            fit: BoxFit.cover
          )
        ),
      ),
      ),
    );
  }
}