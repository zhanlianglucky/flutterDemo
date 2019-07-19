import 'package:flutter/material.dart';

/// 左右滑动首页
void main() => runApp(MaterialApp(
      title: "scroll home style",
      home: HomePageWidget(),
    ));

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  makeBottomTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          text: "home",
          icon: Icon(Icons.home),
        ),
        Tab(
          text: "history",
          icon: Icon(Icons.history),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.white,
    );
  }

  makeTabBarView(List<Widget> children) {
    return TabBarView(
      children: children,
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        bottom: makeBottomTabBar(),
      ),
      body: makeTabBarView([
        OnePageWidget(),
        StepPageWidget(),
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }
}

class OnePageWidget extends StatefulWidget {
  @override
  _OnePageWidgetState createState() => _OnePageWidgetState();
}

class _OnePageWidgetState extends State<OnePageWidget> {
  Widget gridViewItem(int index, String title, IconData iconData) {
    //表格内容
    return Card(
      elevation: 6.0,
      color: Colors.green,
      child: InkWell(
        onTap: () {
          //添加点击事件
          setState(() {
            print("tap index = $index");
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down, //调整内容的排序
          children: <Widget>[
            Icon(
              iconData,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  GridView buildGridView() {
    //表格列表
    return GridView.count(
      crossAxisCount: 2, //2列
      children: List.generate(22, (index) {
        return gridViewItem(index, "android $index", Icons.android);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: buildGridView(),
    );
  }
}

//分步
class StepPageWidget extends StatefulWidget {
  @override
  _StepPageWidgetState createState() => _StepPageWidgetState();
}

class _StepPageWidgetState extends State<StepPageWidget> {
  int currentStep = 0;
  List<Step> steps;

  @override
  void initState() {
    super.initState();
    steps = List.generate(10, (index) {
      return Step(
        title: Text("第${index+1}天"),
        content: Text("Content $index"),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stepper(
        steps: steps,
        currentStep: currentStep,
        onStepTapped: (index){
          setState(() {
            currentStep = index;
          });
        },
        onStepContinue: () {
          setState(() {
            if (currentStep<steps.length){
              currentStep += 1;
            }
          });
        },
        onStepCancel: (){
          setState(() {
            if (currentStep>0){
              currentStep -= 1;
            }
          });
        },
      ),
    );
  }
}
