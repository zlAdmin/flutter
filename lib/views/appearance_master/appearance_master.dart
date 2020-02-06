import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
Dio dio = new Dio();

class AppearanceMaster extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class _MyHomePageState extends State<AppearanceMaster> {
  // 用户通过摄像头获取照片文件
  File _image;
  var _faceInfo;

  // 定义选取照片的函数
  void choosePic(ImageSource imageSource)  async{
    // 得到选取的照片
    var image = await ImagePicker.pickImage(source: imageSource);
    
    // 将用户选择的照片存储到
    setState(() {
     _image = image; 
    });
    // 调用api
    getFaceinfo();
  }

  void getFaceinfo() async {
    //鉴权
    var urlOAuth = 'https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=0LAFP7je450iqHUeyye53THv&client_secret=HKhvvXzGcROls5uaQWvtux6pEfqYX36w';
    var accessResult = await dio.post(urlOAuth);
    var accessToken = accessResult.data['access_token'];

    // 把图片转为base64
    var bytesList = _image.readAsBytesSync();
    var base64Img = base64Encode(bytesList);

    // 调用api
    var faceInfoUrl = 'https://aip.baidubce.com/rest/2.0/face/v3/detect?access_token=' + accessToken;
    var faceInfoResult = await dio.post(
      faceInfoUrl, 
      options: new Options(contentType: ContentType.json), 
      data: {
        'image': base64Img,
        'image_type': 'BASE64',
        'face_field': 'age,beauty,expression,face_shape,gender,glasses,emotion'
      }
    );
    if (faceInfoResult.data['error_msg'] == 'SUCCESS') {
      setState(() {
        _faceInfo = faceInfoResult.data['result']['face_list'][0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: renderBody(),
      floatingActionButton: floatingActionButtons(),
    );
  }
  // 渲染页面的appbar
  Widget appBar() {
    return AppBar(
        title: Text('颜值大师'),
        centerTitle: true,
      );
  }
  // 渲染body区域
  Widget renderBody() {
    if (_image == null) {
      return Center(
          child: Text("请选择照片！")
        );
    }
    return renderResult();
    
  }

  Widget renderResult() {
    return Stack(
      children: <Widget>[
        Image.file(
          _image, 
          fit: BoxFit.cover,
          width: double.infinity, 
          height: double.infinity
        ),
        renderBox()
      ],
    );
  }

  Widget renderBox() {
    if (_faceInfo == null) {
      return Text('数据读取失败');
    }
    return Center(
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white54
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Text('年龄：${_faceInfo['age']}岁'),
                Text('性别：'+ _faceInfo['gender']['type']),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Text('颜值：${_faceInfo['beauty']}分'),
                Text('表情：'+ _faceInfo['expression']['type']),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Text('眼镜：'+ _faceInfo['glasses']['type']),
                Text('情绪：'+ _faceInfo['emotion']['type']),
              ])
            ],),
          ),
        );
  }

  // 渲染底部的浮动按钮区域
  Widget floatingActionButtons() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FloatingActionButton(
        onPressed: () {
          choosePic(ImageSource.camera);
        },
        tooltip: 'photo_camera',
        child: Icon(Icons.photo_camera),
        heroTag: 'photo_camera', // 需要确保唯一
      ),
      FloatingActionButton(
        onPressed: () {
          choosePic(ImageSource.gallery);
        },
        tooltip: 'photo',
        child: Icon(Icons.photo),
        heroTag: 'photo',
      )
      ],
    );
  }
}