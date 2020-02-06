import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeMain extends StatefulWidget {

@override
  _HomeMainState createState() => _HomeMainState();
}


class _HomeMainState extends State<HomeMain> { 

  List swiperDataList=["https://pics4.baidu.com/feed/faf2b2119313b07eb6d3559283dfba2596dd8cc8.jpeg?token=c499cd540a47e2424d875e85d7b05575&s=748708F61EB5805102A793BC03003008","https://cdn1.acmtc.com/banner/e1a2071ace3c49fb858dd4b17a8a6609.jpeg"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: renderAppBar(),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
              child: Swiper(
                outer: false,
                itemBuilder: (c, i) {
                  if(swiperDataList!=null){
                    return CachedNetworkImage(
                          imageUrl: "${swiperDataList[i]}",
                          fit: BoxFit.cover,
                          width: double.infinity, 
                          height: double.infinity,
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                     );
                  }
                },
                pagination:
                    new SwiperPagination(margin: new EdgeInsets.all(5.0)),
                   itemCount: swiperDataList == null ? 0 : swiperDataList.length,
              ),
              constraints:
                  new BoxConstraints.loose(new Size(MediaQuery.of(context).size.width, 180.0))),
          Expanded(
            child:  Center(
              child: Text('在我们身边 \n有这样一群人\n当我们已经进入梦乡的时候\n他们却在寒冷的深夜里\n坚守岗位\n他们初心如磬 使命在肩\n挺身而出 英勇奋战\n为深夜中的阿旗人民保驾护航\n让我们对他们致以最深的敬意'),
            )
          )
        ],
      ),
    );
  }

  // 渲染页面的appbar
  Widget renderAppBar() {
    return AppBar(
        title: Text('众志成城'),
        centerTitle: true,
      );
  }

}