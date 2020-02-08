import 'package:flutter/material.dart';
import 'package:flutter_app_zfy/res/istData.dart';

class FoodList extends StatefulWidget {
  _FoodList createState() => _FoodList();
}

class _FoodList extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食专栏'),
        centerTitle: true,
      ),
      body: redenerBody(),
    );
  }

  redenerBody() {
    return ListView.builder(
      itemCount: foodList.length,
      itemBuilder: _getListData,
    );
  }

  Widget _getListData(context, index) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              foodList[index]['imageUrl'],
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(foodList[index]['title']),
            subtitle: Text(foodList[index]['desc']),
          )
        ],
      ),
    );
  }
}
