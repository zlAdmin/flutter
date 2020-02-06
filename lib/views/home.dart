import 'package:flutter/material.dart';
import 'package:flutter_app_zfy/views/first_page/entertainment.dart';
import 'package:flutter_app_zfy/views/first_page/home_main.dart';
import 'package:flutter_app_zfy/views/first_page/user_main.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AppPage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List tabData = [
    {'text': '首页', 'icon': Icon(Icons.home)},
    {'text': '娱乐频道', 'icon': Icon(Icons.import_contacts)},
    {'text': '个人中心', 'icon': Icon(Icons.account_circle)},
  ];
 List<BottomNavigationBarItem> _myTabs = [];
 List<Widget> _list = List();
 String appBarTitle;

 @override
 void initState() {
   super.initState();
   appBarTitle = tabData[0]['text'];
   for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }

    _list
      ..add(HomeMain())
      ..add(Entertainment())
      ..add(UserMain());
 }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _itemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }
}