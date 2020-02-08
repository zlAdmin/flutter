import 'package:flutter/material.dart';
import 'package:flutter_app_zfy/res/istData.dart';

class OnlineMall extends StatefulWidget {
  @override
  _OnlineMall createState() => _OnlineMall();
  
}

class _OnlineMall extends State<OnlineMall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('在线商城'),
        centerTitle: true,
      ),
      body: renderBody(),
    );
  }

  renderBody() {
    return GridView.builder(
      itemCount: listData.length,
      itemBuilder: this._getListData,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: 0.7,
      ),
    );
  }

  Widget _getListData(context, index) {
    return Container(
          color: Colors.white70,
          child: Column(
            children: <Widget>[
              Image.network(listData[index]['imageUrl']),
              SizedBox(height: 12),
              Text(listData[index]['title'])
            ],
          ),
        );
  }
}