import 'package:flutter/material.dart';

/// 复杂list
void main() => runApp(MaterialApp(
      title: "test listView",
      home: Scaffold(
        appBar: AppBar(
          title: Text("multiple listview"),
        ),
        body: ContentWidget(),
      ),
    ));

class Person {
  Person({this.name, this.age, this.sex});

  String name;
  int age;
  int sex;
}

class ContentWidget extends StatefulWidget {
  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  List<Person> dataList;

  @override
  void initState() {
    super.initState();
    _initDataList();
  }

  _initDataList() {
    dataList = List.generate(10, (i) {
      return Person(
        name: "zhangsan",
        age: i + 10,
        sex: i % 2,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: dataList.length, //注意这个不能少
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: <Widget>[
                            Text("个人信息: "),
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text("${dataList[index].name}$index:"),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.0),
                            ),
                            Text("年龄：${dataList[index].age}"),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.0),
                            ),
                            Text("性别：${dataList[index].sex == 0 ? '男' : '女'}"),
                          ],
                        )),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
