import 'package:flutter/material.dart';

class MoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电影大全'),
        centerTitle: true,
      ),
      body: HomeCenter(),
    );
  }
  

}

class HomeCenter extends StatefulWidget {
  @override
  _MoviesList createState() => _MoviesList();
  
}

class _MoviesList extends State<HomeCenter> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getData()
    );
  }

  List<Widget> getData() {
    List<Widget> list = new List();
    for(var i=0; i< 20; i++) {
      list.add(
        ListTile(
          leading: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581067001469&di=da90f49d9855f5910b3be2f397158ce4&imgtype=0&src=http%3A%2F%2Fmobimg.b-cdn.net%2Fpic%2Fv2%2Fgallery%2Fpreview%2Felovek-pauk_spider_man-kino-lyudi-45537.jpg'),
          title: Text('蜘蛛侠之英雄远征'),
          subtitle: Text('爱奇艺-好莱坞电影快速看《水性杨花》(杰西卡贝尔 本巴恩'),
        )
      );
    }
    return list;
  }
}