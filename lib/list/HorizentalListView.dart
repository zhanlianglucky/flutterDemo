import 'package:flutter/material.dart';

///横向列表
void main() => runApp(
  MaterialApp(
    title: "test horizental listview",
    home: Scaffold(
      appBar: AppBar(
        title: Text("horizental listview"),
      ),
      body: ContentWidget(),
    ),
  )
);

class ImageData{
  String info;
  String path;
  ImageData({this.info,this.path});
}

class ContentWidget extends StatefulWidget {
  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  List<ImageData> dataList;
  @override
  void initState() {
    super.initState();
    dataList = List.generate(20, (i){
      return ImageData(info: "图片$i",path: "assets/images/template-banner.png",);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,//横向列表
          itemCount: dataList.length,
          itemBuilder: (context,index){
            ImageData imageData = dataList[index];
        return Container(
          width: 100.0,
          height: 100.0,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Image.asset(imageData.path,),
              Padding(padding: EdgeInsets.symmetric(vertical: 5.0),),
              Text(imageData.info),
            ],
          ),
        );
      }),
    );
  }
}
