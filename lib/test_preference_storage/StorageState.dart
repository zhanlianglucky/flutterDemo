import 'package:flutter/material.dart';

import 'FileOperate.dart';

///展示存储内容
class StorageState extends State{
  int counter = 0;
  String storageInfo = "";
  FileOperate fileOperate = new FileOperate();

  Future updateStorageInfo() async{
    fileOperate.writeFile("$counter");
    String info = await fileOperate.readFile();
    setState(() {
      storageInfo = info;
      if (storageInfo != ""){
        counter = int.parse(storageInfo);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    updateStorageInfo();
    return new Center(
      child: new Column(
        children: <Widget>[
          new Text("内容：$storageInfo"),
          new Text(""),
          new FloatingActionButton(
              onPressed: (){
                  counter++;
                  updateStorageInfo();
              },
            child: new Icon(Icons.add),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}